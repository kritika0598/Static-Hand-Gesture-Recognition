%Hand Gesture Codes By YMD
                                            %clear stored variables, command windows, close any open windows

%vid=videoinput('winvideo',1);                                             %sets videoinput to the webcam, and the webcam device 1
%figure(3);preview(vid);                                                  %displays the webcam input
figure(1);
%set(vid,'ReturnedColorspace','rgb')
%pause(2);                                                                 % pause 2 seconds before snapshot of background image
IM1=imread('2018-03-25-151113.jpg');                                                     %get snapshot from the webcam video and store to IM1 variable
figure(1);imshow(IM1);title('Background');                 %open up a figure and show the image stored in IM1 variable

%pause(2);                                                                 %pause a second before taking the test image snapshot
IM2=imread('2018-03-25-151056.jpg');                                                    %get snapshot of test image and store to variable IM2
figure(2);imshow(IM2);title('Gesture');                    %open up a figure and show the image stored in IM2 variable


IM3 = IM1 - IM2;                                                            %subtract Backround from Image
figure(3);imshow(IM3);title('Subtracted');                   %show the subtracted image
IM3 = rgb2gray(IM3);                                                        %Converts RGB to Gray
figure(4);imshow(IM3);title('Grayscale');                    %Display Gray Image
lvl = graythresh(IM3);                                                      %find the threshold value using Otsu's method for black and white

IM3 = imbinarize(IM3, lvl);                                                      %Converts image to BW, pixels with value higher than threshold value is changed to 1, lower changed to 0
figure(5);imshow(IM3);title('Black&White');                  %display black and white image
IM3 = bwareaopen(IM3, 10000);
IM3 = imfill(IM3,'holes');
figure(6);imshow(IM3);title('Small Areas removed & Holes Filled');  
IM3 = imerode(IM3,strel('disk',15));                                        %erode image
IM3 = imdilate(IM3,strel('disk',20));                                       %dilate iamge
IM3 = medfilt2(IM3, [5 5]);                                                 %median filtering
figure(7);subplot(5,5,9);imshow(IM3);title('Eroded,Dilated & Median Filtered');  
IM3 = bwareaopen(IM3, 0000);                                               %finds objects, noise or regions with pixel area lower than 10,000 and removes them
figure(7);subplot(5,5,9);imshow(IM3);title('Processed');                    %displays image with reduced noise
IM3 = flip(IM3,1);                                                       %flip image rows
figure(8);imshow(IM3);title('Flip Image');   

