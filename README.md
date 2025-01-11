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
Step 2: Data denoising. During the ERT measurement process, the resistivity data obtained can be affected by environmental noise, measurement equipment, and other factors. Thus, the resistivity data usually contains noise and errors, which can be detrimental to the analysis and interpretation of the results. Noise removal techniques are utilized to reduce or eliminate the impact of noise, and the manual inspection and correction method is used in this study. Negative resistivity values and data points that clearly deviate from the overall trend are considered erroneous and are directly removed. Such denoising processes are repeated several times until the data aligns with geological experience and the trend of resistivity data listed in Table 1. 
Step 3: Data smoothing and data interpolation. Data smoothing is applied to eliminate local high-frequency fluctuations, making the data better reflect the actual trends of subsurface resistivity distribution. The Kriging interpolation method is used to help fill in the gaps of the measurement points obtained from the data denoising process, providing a more complete dataset.
Step 4: Inversion and parameter setting. The inversion problem always involves an optimization process. The optimization method (e.g., Gauss-Newton Method) is used to iteratively change the resistivity of the model cells to minimize the difference between the measured and calculated resistivity values (Loke et al., 2013). The objective function U involved in the optimization process can be expressed as follows: 
 
where m represents the final result of electrical resistivity distribution; ||d- F(m)||2 is the data-fit constrain, which means that the forward response F(m) should be sufficiently close to the measured data d. ||C·m||2 is the model constrain, where C is called the smoothness matrix. More details for solving this equation can refer to Li et al. (2024). The software of Geogiga RImager 6.0 is utilized to help solve the inversion problem (https://www.geogiga.com/products/rtomo/). In the software, the forward response F(m) is solved using the finite element method; the model constraint adopts a smooth constraint, which assumes that resistivity of the geological bodies varies continuously with spatial position (Zohdy, 1989). The inversion process is usually stopped when the relative change in the term rms error is less than 5% (Loke and Barker, 1996), so the convergence limit is set at 5%. Based on the stratigraphies revealed by the boreholes, depth correction on the derived resistivity profiles is also conducted. 
Step 5: Visualization of ERT profiles. The final results of electrical resistivity data are processed with the software Matlab and the related code is also added to the open-access data, and then the ERT profiles are exhibited in Figure 7. 

Table 1. Measured electrical resistivities of the tested stratigraphic layers
------------------------------------------------------------------------------------------------------------
                                     Natural soil     Sandy soil	  Gravel soil	      Gravel
------------------------------------------------------------------------------------------------------------
     Electrical resistivity (Ω·m)	115~162	     273~439	   759~1342	    3646~4217
------------------------------------------------------------------------------------------------------------
Loke, M.H., Chambers, J.E., Rucker, D.F., Kuras, O., Wilkinson, P.B. (2013). Recent developments in the direct-current geoelectrical imaging method. Journal of applied geophysics, 95, 135-156.

Li, F., Li, K., Su, A. Tang, H. (2024). Detection of landslide groundwater based on magnetic resonance sounding given complex topography. Engineering Geology, 331, 107453.

Loke, M.H., Barker, R.D. (1996). Rapid least‐squares inversion of apparent resistivity pseudosections by a quasi‐Newton method1. Geophysical prospecting, 44(1), 131-152.

Zohdy, A.A. 1989. A new method for the automatic interpretation of Schlumberger and Wenner sounding curves. Geophysics, 54 (2), 245- 253.

