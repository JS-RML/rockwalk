import os
import rospkg
import math
import scipy.io as sio

import matlab.engine

import numpy as np


rospack = rospkg.RosPack()
MATLAB_DIR_PATH = os.path.join(rospack.get_path('rockwalk_planner'), 'matlab')


# Set global parameter for the object (modeled as an oblique cone)
OBJECT_RADIUS = 0.35
APEX_VERTICAL_OFFSET = 1.35 # relative to the base plane of the object
APEX_LATERAL_OFFSET = 0.35 # relative to the base center

APEX_FIXED_HEIGHT = 1.26 # this model assumes that the height of th

# Then concatenate the integral curves to these vector field
TOTAL_RELOCATIONS = 30 #Keep it even number
ROCKING_AMPLITUDE = math.radians(15) # Amplitude of rocking motion
OBJECT_HEADING_DIRECTION = math.radians(0) # Measure relative to (world) +ve x-axis.


class ZigzagApexPath:
    """Generate zigzag apex path for the cone by executing MATLAB codes using MATLAB engine for Python.
    See this link for more information: https://www.mathworks.com/help/matlab/matlab-engine-for-python.html?s_tid=CRUX_lftnav
    """

    def __init__(self):

        self._engine = matlab.engine.start_matlab()

        self._engine.addpath(MATLAB_DIR_PATH)

    def fixed_apex_vector_fields(self):

        self._engine.vector_fields(OBJECT_RADIUS,
                                   APEX_VERTICAL_OFFSET,
                                   APEX_LATERAL_OFFSET,
                                   APEX_FIXED_HEIGHT,
                                   MATLAB_DIR_PATH,
                                   nargout=0)


    def generate_zigzag_apex_path(self):

        self._engine.integral_curves_concatenate(ROCKING_AMPLITUDE,
                                                 TOTAL_RELOCATIONS,
                                                 OBJECT_HEADING_DIRECTION,
                                                 MATLAB_DIR_PATH,
                                                 nargout=0)

    def load_zigzag_apex_path(self):

        lr_rocking = sio.loadmat(os.path.join(MATLAB_DIR_PATH,'lr_rocking.mat'))

        right_rocking_target = lr_rocking['right_rock']
        left_rocking_target = lr_rocking['left_rock']

        self._zigzag_apex_path = np.zeros((TOTAL_RELOCATIONS-1, 2))
        self._zigzag_apex_path[::2] = left_rocking_target
        self._zigzag_apex_path[1::2] = right_rocking_target

        return self._zigzag_apex_path
