function y=adj_scPSD(x)

aa = x;
id_rem = find(sum(aa)==0);
aa(:,id_rem) = [];
% y_bal(id_rem) = [];
% idx(id_rem) = [];
% end



cor_x = corr(aa');
cor_x(isnan(cor_x)) = 1;
aa_cor = cor_x*aa;


ps = abs(fft(abs(aa)))/size(aa,1);
pro_ps = ps./sum(ps,1);
Aaa = pro_ps.*log2(pro_ps);
aaa = -mean(Aaa,2)/log2(size(Aaa,2));

bb = abs(ifft(aaa.*fft(aa_cor)/size(aa,1)));
A = LogScale(bb);%normalize(bb','range')';

y = A;

end


% entropy = -mean(Aaa,2)/log2(268);
% bbb = entropy.*ps;