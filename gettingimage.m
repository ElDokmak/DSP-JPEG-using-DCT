function g =gettingimage()
Image = double(imread('image.jpg'));
YCBCR = rgb2ycbcr(Image);
y = YCBCR(:,:,1);
g = y;
end








