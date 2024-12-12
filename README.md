# ERT-field-tests
The open source datasets include three parts: 1_Raw datasets, 2_Inversion datasets, and 3_Figure datasets.

Here are some brief description to these datasets:

1_Raw datasets
The raw datasets contain two formats of files, namely '.cy' format and '.xlsx' format; 
'.cye' are those directly  exported from the instrument;
'.xlsx' are those converted from ‘.cye’ format for easy viewing；

Each format file ('.cye' and '.xlsx') has four files, represent the results measured at the four benchmark cross-sections;
they are: 
('.cye') horizontal structure(raw).cye, inclined structure(raw).cye, fold structure(raw).cye, and sedimentary layers with stratum lenses.cye;  
('.xlsx') horizontal structure(raw).xlsx, inclined structure(raw).xlsx, fold structure(raw).xlsx, and sedimentary layers with stratum lenses.xlsx;  


2_Inversion datasets
The inversion datasets contain one formats of files, namely '.dat' format;
'.dat' are those used for inversion after noise removal, model constraints, and other processing from the raw datasets;
they are: 
('.dat')  horizontal structure.dat, inclined structure.dat, fold structure.dat, and sedimentary layers with stratum lenses.dat;  


3_Figure datasets
The figure datasets contain one formats of files, namely '.xlsx' format, including the 'non-interpolated.xlsx' and 'interpolated.xlsx';
'.xlsx' are those used for visualization of electrical resistivity profiles;
they are;
('.xlsx') horizontal structure.xlsx, inclined structure.xlsx, fold structure.xlsx, and stratum lens.xlsx;                                                             (the inversion results without interpolation)
          horizontal structure(interpolated).xlsx, inclined structure(interpolated).xlsx, fold structure(interpolated).xlsx, and stratum lens(interpolated).xlsx      (the inversion results with interpolation)


===========================================
More details for generating these datasets
===========================================
Step 1: Data format conversion. The data format exported from the electrical instrument (raw data) is ‘inclined structure. cye’ (DZD-8 Full Waveform DC IP Meter, manufactured by the Chongqing Geological Instrument Co. Ltd., https://www.cgif.com.cn/en/displayproduct-180-36.html), which needs to be converted into a ‘inclined structure.dat’ format file for subsequent operations. The software involves in this process is ‘HighDensityElectricMethodAnalyze’, manufactured by the Chongqing Geological Instrument Co. Ltd. And, the raw data file ‘inclined structure.xlsx’ is also provided in the open access datasets. 
Step 2: Data denoising. Due to factors like environmental noise and instrument equipment, the measured electrical resistivity data from the field tests contain noise, which needs to be removed to avoid interference with the inversion process. This process contains two steps: firstly, clearly erroneous data points need to be removed, such as some negative values and data that clearly do not conform to the overall trend of the data; secondly, more detailed noise removal techniques are implemented, such as the weighted median filter. 
Step 3: Inversion and parameter setting. The inversion problem always involves an optimization process. Starting from a simple initial model (usually a homogeneous half-space), an optimization method is used to iteratively change the resistivity of the model cells to minimize the difference between the measured and calculated apparent resistivity values (Loke et al., 2013). The objective function U can be expressed as follows: 
     U = ||d-F(m)||^2 +λ ||C·m||^2
where m represents the final result of electrical resistivity distribution; ||d- F(m)||^2 is the data-fit constrain, which means that the forward response F(m) should be sufficiently close to the measured data d. ||C·m||^2 is the model constrain, where C is called the smoothness matrix. More details for solving this equation can refer to Li et al. (2024). 
As for the parameter setting, the inversion process is usually stopped when the relative change in the term rms error is less than 5% (Loke and Barker, 1996), so the convergence limit is set at 5%. Based on the data measured by the Miller soil box (Table 1), 15% of model constrain in the inclined stratigraphic structure is applied to correct the measurement errors caused by the factor such as soil compactness, moisture content and environmental noise. And depth correction is also utilized based on the stratigraphies revealed by the boreholes. 
Step 4: Visualization of ERT profiles. The final results of electrical resistivity data are processed with the software Matlab and the related code is also added to the open-access data, and then the ERT profiles are exhibited in Figure 7. 

Table 1. Measured electrical resistivities of the tested stratigraphic layers
-----------------------------------------------------------------------------
                            Natural soil Sandy soil	Gravel soil	   Gravel
-----------------------------------------------------------------------------
Electrical resistivity (Ω·m)	115~162	    273~439	   759~1342	    3646~4217
-----------------------------------------------------------------------------
Loke, M. H., Chambers, J. E., Rucker, D. F., Kuras, O., & Wilkinson, P. B. (2013). Recent developments in the direct-current geoelectrical imaging method. Journal of applied geophysics, 95, 135-156.
Li, F., Li, K., Su, A., & Tang, H. (2024). Detection of landslide groundwater based on magnetic resonance sounding given complex topography. Engineering Geology, 331, 107453.
Loke, M. H., & Barker, R. D. (1996). Rapid least‐squares inversion of apparent resistivity pseudosections by a quasi‐Newton method1. Geophysical prospecting, 44(1), 131-152.
