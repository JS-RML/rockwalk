classdef MasterboardDataMsg < robotics.ros.Message
    %MasterboardDataMsg MATLAB implementation of ur_msgs/MasterboardDataMsg
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'ur_msgs/MasterboardDataMsg' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'a4aa4d8ccbd10a18ef4008b679f6ccbe' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        DigitalInputBits
        DigitalOutputBits
        AnalogInputRange0
        AnalogInputRange1
        AnalogInput0
        AnalogInput1
        AnalogOutputDomain0
        AnalogOutputDomain1
        AnalogOutput0
        AnalogOutput1
        MasterboardTemperature
        RobotVoltage48V
        RobotCurrent
        MasterIoCurrent
        MasterSafetyState
        MasterOnoffState
    end
    
    properties (Constant, Hidden)
        PropertyList = {'AnalogInput0', 'AnalogInput1', 'AnalogInputRange0', 'AnalogInputRange1', 'AnalogOutput0', 'AnalogOutput1', 'AnalogOutputDomain0', 'AnalogOutputDomain1', 'DigitalInputBits', 'DigitalOutputBits', 'MasterIoCurrent', 'MasterOnoffState', 'MasterSafetyState', 'MasterboardTemperature', 'RobotCurrent', 'RobotVoltage48V'} % List of non-constant message properties
        ROSPropertyList = {'analog_input0', 'analog_input1', 'analog_input_range0', 'analog_input_range1', 'analog_output0', 'analog_output1', 'analog_output_domain0', 'analog_output_domain1', 'digital_input_bits', 'digital_output_bits', 'master_io_current', 'master_onoff_state', 'master_safety_state', 'masterboard_temperature', 'robot_current', 'robot_voltage_48V'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = MasterboardDataMsg(msg)
            %MasterboardDataMsg Construct the message object MasterboardDataMsg
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function digitalinputbits = get.DigitalInputBits(obj)
            %get.DigitalInputBits Get the value for property DigitalInputBits
            digitalinputbits = int16(obj.JavaMessage.getDigitalInputBits);
        end
        
        function set.DigitalInputBits(obj, digitalinputbits)
            %set.DigitalInputBits Set the value for property DigitalInputBits
            validateattributes(digitalinputbits, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'DigitalInputBits');
            
            obj.JavaMessage.setDigitalInputBits(digitalinputbits);
        end
        
        function digitaloutputbits = get.DigitalOutputBits(obj)
            %get.DigitalOutputBits Get the value for property DigitalOutputBits
            digitaloutputbits = int16(obj.JavaMessage.getDigitalOutputBits);
        end
        
        function set.DigitalOutputBits(obj, digitaloutputbits)
            %set.DigitalOutputBits Set the value for property DigitalOutputBits
            validateattributes(digitaloutputbits, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'DigitalOutputBits');
            
            obj.JavaMessage.setDigitalOutputBits(digitaloutputbits);
        end
        
        function analoginputrange0 = get.AnalogInputRange0(obj)
            %get.AnalogInputRange0 Get the value for property AnalogInputRange0
            analoginputrange0 = int8(obj.JavaMessage.getAnalogInputRange0);
        end
        
        function set.AnalogInputRange0(obj, analoginputrange0)
            %set.AnalogInputRange0 Set the value for property AnalogInputRange0
            validateattributes(analoginputrange0, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogInputRange0');
            
            obj.JavaMessage.setAnalogInputRange0(analoginputrange0);
        end
        
        function analoginputrange1 = get.AnalogInputRange1(obj)
            %get.AnalogInputRange1 Get the value for property AnalogInputRange1
            analoginputrange1 = int8(obj.JavaMessage.getAnalogInputRange1);
        end
        
        function set.AnalogInputRange1(obj, analoginputrange1)
            %set.AnalogInputRange1 Set the value for property AnalogInputRange1
            validateattributes(analoginputrange1, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogInputRange1');
            
            obj.JavaMessage.setAnalogInputRange1(analoginputrange1);
        end
        
        function analoginput0 = get.AnalogInput0(obj)
            %get.AnalogInput0 Get the value for property AnalogInput0
            analoginput0 = double(obj.JavaMessage.getAnalogInput0);
        end
        
        function set.AnalogInput0(obj, analoginput0)
            %set.AnalogInput0 Set the value for property AnalogInput0
            validateattributes(analoginput0, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogInput0');
            
            obj.JavaMessage.setAnalogInput0(analoginput0);
        end
        
        function analoginput1 = get.AnalogInput1(obj)
            %get.AnalogInput1 Get the value for property AnalogInput1
            analoginput1 = double(obj.JavaMessage.getAnalogInput1);
        end
        
        function set.AnalogInput1(obj, analoginput1)
            %set.AnalogInput1 Set the value for property AnalogInput1
            validateattributes(analoginput1, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogInput1');
            
            obj.JavaMessage.setAnalogInput1(analoginput1);
        end
        
        function analogoutputdomain0 = get.AnalogOutputDomain0(obj)
            %get.AnalogOutputDomain0 Get the value for property AnalogOutputDomain0
            analogoutputdomain0 = int8(obj.JavaMessage.getAnalogOutputDomain0);
        end
        
        function set.AnalogOutputDomain0(obj, analogoutputdomain0)
            %set.AnalogOutputDomain0 Set the value for property AnalogOutputDomain0
            validateattributes(analogoutputdomain0, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogOutputDomain0');
            
            obj.JavaMessage.setAnalogOutputDomain0(analogoutputdomain0);
        end
        
        function analogoutputdomain1 = get.AnalogOutputDomain1(obj)
            %get.AnalogOutputDomain1 Get the value for property AnalogOutputDomain1
            analogoutputdomain1 = int8(obj.JavaMessage.getAnalogOutputDomain1);
        end
        
        function set.AnalogOutputDomain1(obj, analogoutputdomain1)
            %set.AnalogOutputDomain1 Set the value for property AnalogOutputDomain1
            validateattributes(analogoutputdomain1, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogOutputDomain1');
            
            obj.JavaMessage.setAnalogOutputDomain1(analogoutputdomain1);
        end
        
        function analogoutput0 = get.AnalogOutput0(obj)
            %get.AnalogOutput0 Get the value for property AnalogOutput0
            analogoutput0 = double(obj.JavaMessage.getAnalogOutput0);
        end
        
        function set.AnalogOutput0(obj, analogoutput0)
            %set.AnalogOutput0 Set the value for property AnalogOutput0
            validateattributes(analogoutput0, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogOutput0');
            
            obj.JavaMessage.setAnalogOutput0(analogoutput0);
        end
        
        function analogoutput1 = get.AnalogOutput1(obj)
            %get.AnalogOutput1 Get the value for property AnalogOutput1
            analogoutput1 = double(obj.JavaMessage.getAnalogOutput1);
        end
        
        function set.AnalogOutput1(obj, analogoutput1)
            %set.AnalogOutput1 Set the value for property AnalogOutput1
            validateattributes(analogoutput1, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'AnalogOutput1');
            
            obj.JavaMessage.setAnalogOutput1(analogoutput1);
        end
        
        function masterboardtemperature = get.MasterboardTemperature(obj)
            %get.MasterboardTemperature Get the value for property MasterboardTemperature
            masterboardtemperature = single(obj.JavaMessage.getMasterboardTemperature);
        end
        
        function set.MasterboardTemperature(obj, masterboardtemperature)
            %set.MasterboardTemperature Set the value for property MasterboardTemperature
            validateattributes(masterboardtemperature, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'MasterboardTemperature');
            
            obj.JavaMessage.setMasterboardTemperature(masterboardtemperature);
        end
        
        function robotvoltage48v = get.RobotVoltage48V(obj)
            %get.RobotVoltage48V Get the value for property RobotVoltage48V
            robotvoltage48v = single(obj.JavaMessage.getRobotVoltage48V);
        end
        
        function set.RobotVoltage48V(obj, robotvoltage48v)
            %set.RobotVoltage48V Set the value for property RobotVoltage48V
            validateattributes(robotvoltage48v, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'RobotVoltage48V');
            
            obj.JavaMessage.setRobotVoltage48V(robotvoltage48v);
        end
        
        function robotcurrent = get.RobotCurrent(obj)
            %get.RobotCurrent Get the value for property RobotCurrent
            robotcurrent = single(obj.JavaMessage.getRobotCurrent);
        end
        
        function set.RobotCurrent(obj, robotcurrent)
            %set.RobotCurrent Set the value for property RobotCurrent
            validateattributes(robotcurrent, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'RobotCurrent');
            
            obj.JavaMessage.setRobotCurrent(robotcurrent);
        end
        
        function masteriocurrent = get.MasterIoCurrent(obj)
            %get.MasterIoCurrent Get the value for property MasterIoCurrent
            masteriocurrent = single(obj.JavaMessage.getMasterIoCurrent);
        end
        
        function set.MasterIoCurrent(obj, masteriocurrent)
            %set.MasterIoCurrent Set the value for property MasterIoCurrent
            validateattributes(masteriocurrent, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'MasterIoCurrent');
            
            obj.JavaMessage.setMasterIoCurrent(masteriocurrent);
        end
        
        function mastersafetystate = get.MasterSafetyState(obj)
            %get.MasterSafetyState Get the value for property MasterSafetyState
            mastersafetystate = typecast(int8(obj.JavaMessage.getMasterSafetyState), 'uint8');
        end
        
        function set.MasterSafetyState(obj, mastersafetystate)
            %set.MasterSafetyState Set the value for property MasterSafetyState
            validateattributes(mastersafetystate, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'MasterSafetyState');
            
            obj.JavaMessage.setMasterSafetyState(mastersafetystate);
        end
        
        function masteronoffstate = get.MasterOnoffState(obj)
            %get.MasterOnoffState Get the value for property MasterOnoffState
            masteronoffstate = typecast(int8(obj.JavaMessage.getMasterOnoffState), 'uint8');
        end
        
        function set.MasterOnoffState(obj, masteronoffstate)
            %set.MasterOnoffState Set the value for property MasterOnoffState
            validateattributes(masteronoffstate, {'numeric'}, {'nonempty', 'scalar'}, 'MasterboardDataMsg', 'MasterOnoffState');
            
            obj.JavaMessage.setMasterOnoffState(masteronoffstate);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.DigitalInputBits = obj.DigitalInputBits;
            cpObj.DigitalOutputBits = obj.DigitalOutputBits;
            cpObj.AnalogInputRange0 = obj.AnalogInputRange0;
            cpObj.AnalogInputRange1 = obj.AnalogInputRange1;
            cpObj.AnalogInput0 = obj.AnalogInput0;
            cpObj.AnalogInput1 = obj.AnalogInput1;
            cpObj.AnalogOutputDomain0 = obj.AnalogOutputDomain0;
            cpObj.AnalogOutputDomain1 = obj.AnalogOutputDomain1;
            cpObj.AnalogOutput0 = obj.AnalogOutput0;
            cpObj.AnalogOutput1 = obj.AnalogOutput1;
            cpObj.MasterboardTemperature = obj.MasterboardTemperature;
            cpObj.RobotVoltage48V = obj.RobotVoltage48V;
            cpObj.RobotCurrent = obj.RobotCurrent;
            cpObj.MasterIoCurrent = obj.MasterIoCurrent;
            cpObj.MasterSafetyState = obj.MasterSafetyState;
            cpObj.MasterOnoffState = obj.MasterOnoffState;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.DigitalInputBits = strObj.DigitalInputBits;
            obj.DigitalOutputBits = strObj.DigitalOutputBits;
            obj.AnalogInputRange0 = strObj.AnalogInputRange0;
            obj.AnalogInputRange1 = strObj.AnalogInputRange1;
            obj.AnalogInput0 = strObj.AnalogInput0;
            obj.AnalogInput1 = strObj.AnalogInput1;
            obj.AnalogOutputDomain0 = strObj.AnalogOutputDomain0;
            obj.AnalogOutputDomain1 = strObj.AnalogOutputDomain1;
            obj.AnalogOutput0 = strObj.AnalogOutput0;
            obj.AnalogOutput1 = strObj.AnalogOutput1;
            obj.MasterboardTemperature = strObj.MasterboardTemperature;
            obj.RobotVoltage48V = strObj.RobotVoltage48V;
            obj.RobotCurrent = strObj.RobotCurrent;
            obj.MasterIoCurrent = strObj.MasterIoCurrent;
            obj.MasterSafetyState = strObj.MasterSafetyState;
            obj.MasterOnoffState = strObj.MasterOnoffState;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.DigitalInputBits = obj.DigitalInputBits;
            strObj.DigitalOutputBits = obj.DigitalOutputBits;
            strObj.AnalogInputRange0 = obj.AnalogInputRange0;
            strObj.AnalogInputRange1 = obj.AnalogInputRange1;
            strObj.AnalogInput0 = obj.AnalogInput0;
            strObj.AnalogInput1 = obj.AnalogInput1;
            strObj.AnalogOutputDomain0 = obj.AnalogOutputDomain0;
            strObj.AnalogOutputDomain1 = obj.AnalogOutputDomain1;
            strObj.AnalogOutput0 = obj.AnalogOutput0;
            strObj.AnalogOutput1 = obj.AnalogOutput1;
            strObj.MasterboardTemperature = obj.MasterboardTemperature;
            strObj.RobotVoltage48V = obj.RobotVoltage48V;
            strObj.RobotCurrent = obj.RobotCurrent;
            strObj.MasterIoCurrent = obj.MasterIoCurrent;
            strObj.MasterSafetyState = obj.MasterSafetyState;
            strObj.MasterOnoffState = obj.MasterOnoffState;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.ur_msgs.MasterboardDataMsg.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.ur_msgs.MasterboardDataMsg;
            obj.reload(strObj);
        end
    end
end