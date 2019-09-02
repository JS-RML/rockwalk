import rospy
from geometry_msgs.msg import Point
from rockwalk_planner.srv import ApexPoint, ApexPointResponse


class ApexPointServer:
    """Server to handle apex point requests"""

    def __init__(self, zigzag_apex_path):

        self._zigzag_apex_path = zigzag_apex_path

        self._apex_point_service = rospy.Service('apex_point', ApexPoint, self.handle_request)


    def handle_request(self, request):
        rospy.loginfo("next apex point request received")

        apex_point = self.next_apex_point(request)

        return ApexPointResponse(apex_point)


    def next_apex_point(self, request):

        apex_point = Point()
        apex_point.x = self._zigzag_apex_path[request.rockwalk_step, 0]
        apex_point.y = self._zigzag_apex_path[request.rockwalk_step, 1]
        apex_point.z = 0

        return apex_point
