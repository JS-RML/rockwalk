// Auto-generated. Do not edit!

// (in-package ur10_cm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class dual_arm_eff_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.hong_target_pose = null;
      this.kong_target_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('hong_target_pose')) {
        this.hong_target_pose = initObj.hong_target_pose
      }
      else {
        this.hong_target_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('kong_target_pose')) {
        this.kong_target_pose = initObj.kong_target_pose
      }
      else {
        this.kong_target_pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dual_arm_eff_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [hong_target_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.hong_target_pose, buffer, bufferOffset);
    // Serialize message field [kong_target_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.kong_target_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dual_arm_eff_msg
    let len;
    let data = new dual_arm_eff_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [hong_target_pose]
    data.hong_target_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [kong_target_pose]
    data.kong_target_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ur10_cm/dual_arm_eff_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed9e1d286bd8f03ad213c307ed3832c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Pose hong_target_pose
    geometry_msgs/Pose kong_target_pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dual_arm_eff_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.hong_target_pose !== undefined) {
      resolved.hong_target_pose = geometry_msgs.msg.Pose.Resolve(msg.hong_target_pose)
    }
    else {
      resolved.hong_target_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.kong_target_pose !== undefined) {
      resolved.kong_target_pose = geometry_msgs.msg.Pose.Resolve(msg.kong_target_pose)
    }
    else {
      resolved.kong_target_pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

module.exports = dual_arm_eff_msg;
