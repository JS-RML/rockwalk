import rospy
from geometry_msgs.msg import Pose, PoseArray, Point, Quaternion
from rockwalk_planner.srv import ApexPath, ApexPathResponse


class ApexPathServer:
    """Server to handle apex path requests"""

    def __init__(self, apex_path):

        self._complete_apex_path = apex_path

        self._apex_path_service = rospy.Service('compute_apex_path', ApexPath, self.handle_request)


    def handle_request(self, request):
        rospy.loginfo("apex path request received")

        apex_path = self.compute_apex_path(request)

        return ApexPathResponse(apex_path)


    def compute_apex_path(self, request):
        apex_path = []

        next_target = Point()
        next_target.x = self._complete_apex_path[request.rockwalk_step,0]
        next_target.y = self._complete_apex_path[request.rockwalk_step,1]
        next_target.z = 0

        apex_path.append(next_target)

        return apex_path
