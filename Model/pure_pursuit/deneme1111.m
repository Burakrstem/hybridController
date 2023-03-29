% Verilen x ve y noktaları listesi
continuousX=[];
continuousY=[];
for i=1:length(roadX)-1
    continuousX=[continuousX linspace(roadX(i),roadX(i+1),100)];
    continuousY=[continuousY linspace(roadY(i),roadY(i+1),100)];
end

plot(continuousX,continuousY,'o');


