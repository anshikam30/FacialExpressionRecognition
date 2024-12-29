function varargout = MainFileView(varargin)
% MAINFILEVIEW MATLAB code for MainFileView.fig
%      MAINFILEVIEW, by itself, creates a new MAINFILEVIEW or raises the existing
%      singleton*.
%
%      H = MAINFILEVIEW returns the handle to a new MAINFILEVIEW or the handle to
%      the existing singleton*.
%
%      MAINFILEVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFILEVIEW.M with the given input arguments.
%
%      MAINFILEVIEW('Property','Value',...) creates a new MAINFILEVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainFileView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainFileView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainFileView

% Last Modified by GUIDE v2.5 18-Oct-2021 11:29:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainFileView_OpeningFcn, ...
                   'gui_OutputFcn',  @MainFileView_OutputFcn, ...
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


% --- Executes just before MainFileView is made visible.
function MainFileView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainFileView (see VARARGIN)

% Choose default command line output for MainFileView
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainFileView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainFileView_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Perform Two_fold_Preprocessing
% Load Image Data
disp("|-----------------------|");
disp(" Bi-level Preprocessing ");
disp("|-----------------------|");
cd TestImages
[filename, pathname] = uigetfile('*.png;*.bmp;*.jpg', 'Select the Image File');
if isequal(filename,0) || isequal(pathname,0)
    warndlg('User pressed cancel');
else
    figure('name','Selected Image');
    % disp(['User selected ', fullfile(pathname, filename)]);
    im = imread(filename);
    im=imresize(im,[256 256]);
    I2 = imread([pathname,filename]);
    imwrite(I2,'InputImg.png','png');
    imshow(I2);
    title('Selected Image');
    pause(2);
    msgbox('The selected image loaded sucessfully'); 
    imwrite(I2,'E:\Matlab\GCapsNet Multi-Feature Aware Pose and Geometry based Facial Expression Recognition using Deep Learning\Code\Proposed - GCapsNet\Frontalface.png')
end

% Grayscale algorithm to convert the normal facial image to grayscale image
pause(3);
Grayscale_image

pause(5);
grayImage = imread('facial.png');
[rows, columns, numberOfColorchannels] = size(grayImage);
% Make grid every 64 rows
for row = 8 : 64 : rows
	grayImage(row, :, :) = 255;
end
% Make grid every 32 columns
for col = 8 : 32 : rows
	grayImage(:, col, :) = 255;
end
figure
imshow(grayImage);

I = imread('facial.png');
targetSize = [300 400];
r = centerCropWindow2d(size(I),targetSize);
J = imcrop(I,r);
imshow(J)

imwrite(I,'E:\Matlab\GCapsNet Multi-Feature Aware Pose and Geometry based Facial Expression Recognition using Deep Learning\Code\Proposed - GCapsNet\Normalized.png')

msgbox('Bi-level Preprocessing is successfully completed');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Perform Entropy Based Adaptive Filtering Algorithm (EAFA)
disp("|------------------------------------------------------------|");
disp(" Clustering-based Segmentation and Facial Landmark Detection  ");
disp("|------------------------------------------------------------|");

Segmentation();
pause(5);
Landmark_Detection();

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Perform Improved Mask R-CNN for Pose Estimation step
disp("|-------------------------------------------------------------|");
disp(" Multi-Feature Extraction and Facial Expression Classification");
disp("|--------------------------------------------------------------|");
Feature_Extraction



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Multi-Feature Extraction and Feature Fusion
disp("|--------------------------------|");
disp(" Facial Expression Classification ");
disp("|--------------------------------|");
Facial_Expression_Classification

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Performance();
