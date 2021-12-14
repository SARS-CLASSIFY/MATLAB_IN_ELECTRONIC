function img_interp2(src_path,save_path)
    w0 = imread(src_path);
    % imshow(w0);
    size_src = size(w0);
    width = size_src(2);
    height = size_src(1);
    %linspace插值
    x1=linspace(1,width,2*width);
    y1=linspace(1,height,500);

    x0=linspace(1,width,width);
    y0=linspace(1,height,height);

    %interp2s双线性插值
    B = zeros(500,2*width,3);
    for i=1:3
        B(:,:,i)=interp2(x0,y0',double(w0(:,:,i)),x1,y1','linear');
    end

    B1 = uint8(B);
    imwrite(B1,save_path);
end

