close all;
clear all;

BLEAQ_URL = 'https://github.com/msu-coinlab/BLEAQ2/archive/master.zip';

disp('Downloading BLEAQ2...');
websave('BLEAQ2.zip', BLEAQ_URL);

disp('Uzipping BLEAQ2...');
unzip('BLEAQ2.zip','./');
mkdir 'BLEAQ2';
movefile 'BLEAQ2-master/*' 'BLEAQ2';
rmdir('BLEAQ2-master', 's');
delete('BLEAQ2.zip');



PMM_URL = 'https://github.com/jmejia8/bilevel-benchmark-matlab/archive/master.zip';

disp('Downloading Bilevel benchmark...');
websave('lib.zip', PMM_URL);

disp('Uzipping Bilevel benchmark...');
unzip('lib.zip','./');
mkdir 'bilevel-benchmark';
movefile 'bilevel-benchmark-matlab-master/*' 'bilevel-benchmark';
rmdir('bilevel-benchmark-matlab-master', 's');

display('Compiling PMM_leader...');
cd bilevel-benchmark
setup;
cd ..
delete('lib.zip');

disp('Adding dependencies to path...');
addpath('./BLEAQ2/');
addpath('./bilevel-benchmark/');

disp('Done!');