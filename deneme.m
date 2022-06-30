function varargout = deneme(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename,'gui_Singleton',gui_Singleton,'gui_OpeningFcn', @deneme_OpeningFcn, ...
                   'gui_OutputFcn', @deneme_OutputFcn,'gui_LayoutFcn',  [] , 'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function deneme_OpeningFcn(hObject, eventdata, handles, varargin)
global i
global soru
global butterfly_icon
global sadicon
global imy
handles.output = hObject;
image=imread('our_pictures.jpg');
axes(handles.logo);
imshow('heart_logo.png')
axes(handles.logo2);
imshow('butterfly_logo.png')
set(handles.text3,'string','Teste başlamak istiyor musun?')
set(handles.true,'string','EVET')
set(handles.false,'string','HAYIR')
axes(handles.axes1);
butterfly_icon = imread("butterfly_icon.png");
sadicon = imread("sad_icon.jpg");
imy=im2double(image);
i=1;
soru={'Beni seviyor musun?','Beni hep sevecek misin?','Bana inanıyor musun?','Bana güveniyor musun?', ...
    'Ömrünü benimle paylaşmak istiyor musun?','İyi bir çift olacağımızı düşünüyor musun?',...
    'İyi bir ebeveyn olacağımızı düşünüyor musun?','Kötü günlerimde bana destek olacak mısın?', ...
    'Hayalindeki kişi miyim?',"Birbirimizi ilk gördüğümüz o harika günün tarihi nedir?","BENİMLE EVLENİR MİSİN ?"};

function varargout = deneme_OutputFcn(hObject, eventdata, handles) 
% varargout{1} = handles.output;

function pushbutton_yes_Callback(hObject, eventdata, handles)
global i
global soru
global butterfly_icon
global imy
if i<=9
    set(handles.text3,'string',soru(i))
    axes(handles.axes1)
    val=0.1*i-0.95;
    impar=imy+val; %parlaklık artırma
    imshow(impar)
    i=i+1; 
elseif i==10
    set(handles.text3,'string',soru(i))
    set(handles.true,'string','23/07/2020')
    set(handles.false,'string','23/06/2019')
    i=i+1;
elseif i==11
    set(handles.text3,'string',soru(i))
    set(handles.true,'string','EVET')
    set(handles.false,'string','HAYIR')
    i=i+1;
elseif i>11
    set(handles.text3,'string',"SENİ SEVİYORUM")
    set(handles.true,'string','DİCLE')
    set(handles.false,'string','FIRAT')
    msgbox('İşte şimdi kalbimde kelebekler uçuşuyor :)))',"Succes!!!","custom",butterfly_icon);
end

function pushbutton_no_Callback(hObject, eventdata, handles)
global sadicon
msgbox('Yanlış cevap',"HATA","custom",sadicon);

function exit_Callback(hObject, eventdata, handles)
delete(handles.figure1);
clear