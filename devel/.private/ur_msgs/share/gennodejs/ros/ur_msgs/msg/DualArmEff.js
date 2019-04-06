// Auto-generated. Do not edit!

// (in-package ur_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class DualArmEff {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.HongTargetPose = null;
      this.KongTargetPose = null;
    }
    else {
      if (initObj.hasOwnProperty('HongTargetPose')) {
        this.HongTargetPose = initObj.HongTargetPose
      }
      else {
        this.HongTargetPose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('KongTargetPose')) {
        this.KongTargetPose = initObj.KongTargetPose
      }
      else {
        this.KongTargetPose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DualArmEff
    // Serialize message field [HongTargetPose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.HongTargetPose, buffer, bufferOffset);
    // Serialize message field [KongTargetPose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.KongTargetPose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DualArmEff
    let len;
    let data = new DualArmEff(null);
    // Deserialize message field [HongTargetPose]
    data.HongTargetPose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [KongTargetPose]
    data.KongTargetPose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ur_msgs/DualArmEff';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dc2cdf957047a17b7bfeba54584a1753';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose HongTargetPose
    geometry_msgs/Pose KongTargetPose
    
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
    const resolved = new DualArmEff(null);
    if (msg.HongTargetPose !== undefined) {
      resolved.HongTargetPose = geometry_msgs.msg.Pose.Resolve(msg.HongTargetPose)
    }
    else {
      resolved.HongTargetPose = new geometry_msgs.msg.Pose()
    }

    if (msg.KongTargetPose !== undefined) {
      resolved.KongTargetPose = geometry_msgs.msg.Pose.Resolve(msg.KongTargetPose)
    }
    else {
      resolved.KongTargetPose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

module.exports = DualArmEff;
