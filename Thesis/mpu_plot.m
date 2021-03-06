%% Prep code - MPU9250

Gyro_Z_NoBias = Gyro_Z - mean(Gyro_Z);
mpu_gyro_bias = mean(Gyro_Z);


%if(length(mpuGyroSim)>length(Gyro_Z))
%    mpuGyroSim = mpuGyroSim(1:end-1);
%end

%mpuGyroSimNoBias = mpuGyroSim - mean(mpuGyroSim);
figure(1)
%plot(Time,[mpuGyroSim, Gyro_Z])
legend('Sim', 'Real');
figure(2)
subplot(2,2,1)
[f2, amp2] = myfft(Gyro_Z_NoBias*mpu_gyro_sensitivity,1/mpu_sampling_frequency);
hold on;
%[f2, amp2] = myfft(mpuGyroSimNoBias*mpu_gyro_sensitivity,1/mpu_sampling_frequency);
legend('Real','Sim');

subplot(2,2,2)
[f2, amp2] = myfft(Gyro_Z_NoBias*mpu_gyro_sensitivity,1/mpu_sampling_frequency);
legend('Real');

subplot(2,2,3)
%[f2, amp2] = myfft(mpuGyroSimNoBias*mpu_gyro_sensitivity,1/mpu_sampling_frequency);
legend('Sim');
