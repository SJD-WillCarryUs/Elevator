classdef testELEAPP3 < matlab.uitest.TestCase
    properties
       ele1_app
       ele2_app
       flr1_app
       flr2_app
       flr3_app
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
            ele1 = Elevator1;
            ele2 = Elevator2;
            flr1 = Floor1;
            flr2 = Floor2;
            flr3 = Floor3;
            controller = ControlUnit;
            
            testCase.ele1_app = elevator1;
            testCase.ele2_app = elevator2;
            ele1_mod = ele1_model;
            ele2_mod = ele2_model;
            testCase.flr1_app = floor1;
            testCase.flr2_app = floor2;
            testCase.flr3_app = floor3;
            
            controller.ele1 = ele1;
            controller.ele2 = ele2;
            controller.floor1 = flr1;
            controller.floor2 = flr2;
            controller.floor3 = flr3;
            
            
            ele1.app = testCase.ele1_app;
            ele1.controller = controller;
            
            testCase.ele1_app.inside_panel = ele1;
            ele1.model = ele1_mod;
            
            ele2.app = testCase.ele2_app;
            ele2.controller = controller;
            
            testCase.ele2_app.inside_panel = ele2;
            ele2.model = ele2_mod;

            flr1.app = testCase.flr1_app;
            flr1.controller = controller;
            
            testCase.flr1_app.outside_panel = flr1;
            
            flr2.app = testCase.flr2_app;
            flr2.controller = controller;
            
            testCase.flr2_app.outside_panel = flr2;
            
            flr3.app = testCase.flr3_app;
            flr3.controller = controller;
            
            testCase.flr3_app.outside_panel = flr3;
            
            
            % testCase.addTeardown(@delete,testCase.app);
        end
    end
    methods (Test)
        function test_SelectButtonPushed(testCase)
            % testcase 3
            % ele1 1-2, ele2 1-3
            testCase.press(testCase.flr1_app.UpButton);            
            pause(2);
            testCase.press(testCase.ele1_app.Floor2Check);      
            pause(2);
            testCase.press(testCase.flr1_app.UpButton);            
            pause(2);
            testCase.press(testCase.ele2_app.Floor3Check);      
            pause(0.5)
            testCase.press(testCase.flr3_app.DownButton);      
            pause(2);
        end
        
    end
    
end