function resp = exampleHelperROS2EmptyCallback(~,resp)
%exampleHelperROS2EmptyCallback Callback function used by a ROS 2 service server
%   exampleHelperROS2EmptyCallback(~,RESP) returns no arguments. it simply
%   displays a message indicating that it has been called.
%
%   See also CallAndProvideROS2ServicesExample, exampleHelperROS2CreateSampleNetwork.

%   Copyright 2021 The MathWorks, Inc.

disp('A service client is calling');

end