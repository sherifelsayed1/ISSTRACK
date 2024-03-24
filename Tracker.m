 function varargout = Tracker(varargin)
% TRACKER MATLAB code for Tracker.fig
%      TRACKER, by itself, creates a new TRACKER or raises the existing
%      singleton*.
%
%      H = TRACKER returns the handle to a new TRACKER or the handle to
%      the existing singleton*.
%
%      TRACKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRACKER.M with the given input arguments.
%
%      TRACKER('Property','Value',...) creates a new TRACKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tracker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tracker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tracker

% Last Modified by GUIDE v2.5 08-Jan-2017 13:10:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tracker_OpeningFcn, ...
                   'gui_OutputFcn',  @Tracker_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Tracker is made visible.
function Tracker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tracker (see VARARGIN)

% Choose default command line output for Tracker
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('back.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

axes(handles.axes3);
map=imread('Earth_map.jpg');
view(2);
axis off
imagesc([-180 180], [-90 90],map);
% UIWAIT makes Tracker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tracker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
s=get(handles.radiobutton3,'Value');
s2=get(handles.radiobutton4,'Value');
s3=get(handles.radiobutton5,'Value');
s4=get(handles.radiobutton6,'Value');
global satellite_number semi_major_axis name n;
if(s3==1)
    satellite_number=1;
    name='ISS';
end
if(s4==1)
    satellite_number=2;
    name='BIROS';
end
if(s2==1||s==1)
    
    if(s3==1||s4==1)
        get_data;
        GM=398.6005e12;%EARTH property
        N=n(end);
        %computing the semiMajorAxis
        semi_major_axis=((GM)/(N*(2*pi/(86400)))^2)^(1/3);
        if(s==1)
            cla
            main_Tracking;
        end
        if(s2==1)
            cla
            main_SKYPLOT;
        end
    else
       m=msgbox('Please Choose Satellite to track..!!','Help'); 
       pause(0.5);
       delete(m);
    end
    
    
end
if((s2==0||s==0)&&(s3==1||s4==1))
   m=msgbox('Please Choose Tracking Mode..!!','Help'); 
   pause(0.5);
   delete(m);
end



% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
s=get(handles.radiobutton4,'Value');
if(s==1)
    set(handles.radiobutton4,'Value',0);
end

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
s=get(handles.radiobutton3,'Value');
if(s==1)
    set(handles.radiobutton3,'Value',0);
end

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
s=get(handles.radiobutton6,'Value');
if(s==1)
    set(handles.radiobutton6,'Value',0);
end

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
s=get(handles.radiobutton5,'Value');
if(s==1)
    set(handles.radiobutton5,'Value',0);
end
