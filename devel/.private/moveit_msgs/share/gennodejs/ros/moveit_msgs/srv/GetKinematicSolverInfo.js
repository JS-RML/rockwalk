// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let KinematicSolverInfo = require('../msg/KinematicSolverInfo.js');

//-----------------------------------------------------------

class GetKinematicSolverInfoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetKinematicSolverInfoRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetKinematicSolverInfoRequest
    let len;
    let data = new GetKinematicSolverInfoRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetKinematicSolverInfoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetKinematicSolverInfoRequest(null);
    return resolved;
    }
};

class GetKinematicSolverInfoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.kinematic_solver_info = null;
    }
    else {
      if (initObj.hasOwnProperty('kinematic_solver_info')) {
        this.kinematic_solver_info = initObj.kinematic_solver_info
      }
      else {
        this.kinematic_solver_info = new KinematicSolverInfo();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetKinematicSolverInfoResponse
    // Serialize message field [kinematic_solver_info]
    bufferOffset = KinematicSolverInfo.serialize(obj.kinematic_solver_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetKinematicSolverInfoResponse
    let len;
    let data = new GetKinematicSolverInfoResponse(null);
    // Deserialize message field [kinematic_solver_info]
    data.kinematic_solver_info = KinematicSolverInfo.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += KinematicSolverInfo.getMessageSize(object.kinematic_solver_info);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetKinematicSolverInfoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b591d98efeb66095c1b33a70221cab5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    KinematicSolverInfo kinematic_solver_info
    
    ================================================================================
    MSG: moveit_msgs/KinematicSolverInfo
    # A list of joints in the kinematic tree
    string[] joint_names
    # A list of joint limits corresponding to the joint names
    moveit_msgs/JointLimits[] limits
    # A list of links that the kinematics node provides solutions for
    string[] link_names
    
    ================================================================================
    MSG: moveit_msgs/JointLimits
    # This message contains information about limits of a particular joint (or control dimension)
    string joint_name
    
    # true if the joint has position limits
    bool has_position_limits
    
    # min and max position limits
    float64 min_position
    float64 max_position
    
    # true if joint has velocity limits
    bool has_velocity_limits
    
    # max velocity limit
    float64 max_velocity
    # min_velocity is assumed to be -max_velocity
    
    # true if joint has acceleration limits
    bool has_acceleration_limits
    # max acceleration limit
    float64 max_acceleration
    # min_acceleration is assumed to be -max_acceleration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetKinematicSolverInfoResponse(null);
    if (msg.kinematic_solver_info !== undefined) {
      resolved.kinematic_solver_info = KinematicSolverInfo.Resolve(msg.kinematic_solver_info)
    }
    else {
      resolved.kinematic_solver_info = new KinematicSolverInfo()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetKinematicSolverInfoRequest,
  Response: GetKinematicSolverInfoResponse,
  md5sum() { return '9b591d98efeb66095c1b33a70221cab5'; },
  datatype() { return 'moveit_msgs/GetKinematicSolverInfo'; }
};
