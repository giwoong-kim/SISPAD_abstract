### Conventions ··· p.48
### Customer Support ··· p.49
### Acknowledgments ··· p.50
### Statement on Inclusivity and Diversity ··· p.50
# Part I:Getting Started
## 1.Introduction to Sentaurus Device ··· p.52
### Sentaurus Device Functionality ··· p.52
#### Creating and Meshing Device Structures ··· p.54
#### Tool Flow ··· p.54
#### Generating Input Files for Sentaurus Device ··· p.55
### Starting Sentaurus Device ··· p.56
#### From the Command Line ··· p.56
#### From Sentaurus Workbench ··· p.57
### TCAD Sentaurus Tutorial: Simulation Projects ··· p.57
## 2.Specifying Physical Devices ··· p.58
### Reading a Structure ··· p.58
#### Cylindrical Coordinate System ··· p.59
#### Abrupt and Graded Heterojunctions ··· p.60
### Specifying Doping Species ··· p.61
### Specifying Materials ··· p.63
#### User-Defined Materials ··· p.64
#### Mole-Fraction Materials ··· p.65
### Mole-Fraction Specification ··· p.66
### Physical Models and the Hierarchy of Their Specification ··· p.67
#### Region-Specific and Material-Specific Models ··· p.68
#### Interface-Specific Models ··· p.70
#### Electrode-Specific Models ··· p.71
### Physical Model Parameters ··· p.72
#### Search Strategy for Parameter Files ··· p.74
#### Parameters for Composition-Dependent Materials ··· p.75
##### Ternary Semiconductor Composition ··· p.77
##### Quaternary Semiconductor Composition ··· p.79
##### Default Model Parameters for Compound Semiconductors ··· p.80
#### Combining Parameter Specifications ··· p.81
##### Default Parameters ··· p.82
##### User-Specified Parameter Files ··· p.82
#### Generating a Copy of Parameter File ··· p.85
#### Undefined Physical Models ··· p.87
#### Default Parameters ··· p.89
#### Named Parameter Sets ··· p.90
#### Auto-Orientation Framework ··· p.91
##### Changing Orientations Used With Auto-Orientation ··· p.92
##### Auto-Orientation Smoothing ··· p.92
### References ··· p.93
## 3.Mixed-Mode Simulations ··· p.95
### Overview of Mixed-Mode Simulations ··· p.95
### Compact Models ··· p.96
#### Hierarchical Description of Compact Models ··· p.96
#### User-Defined Compact Models ··· p.99
### PrimeSim HSPICE Netlist Files ··· p.100
#### Structure of Netlist Files ··· p.100
##### Comments ··· p.101
##### Continuation Lines ··· p.101
##### The .INCLUDE Statement ··· p.101
##### Numeric Constants ··· p.101
##### Parameters and Expressions ··· p.102
##### Subcircuits ··· p.102
##### The .MODEL Statement ··· p.103
##### Elements ··· p.104
##### Netlist Commands ··· p.105
#### Specifying Physical Devices in Netlists ··· p.105
### SPICE Circuit Files ··· p.106
#### Example ··· p.107
### Command File for Mixed-Mode Simulations ··· p.109
#### System Section ··· p.109
##### Physical Devices ··· p.110
##### Circuit Devices ··· p.111
##### Electrical and Thermal Netlists ··· p.111
##### Initializing Nodes ··· p.114
##### Plotting Quantities ··· p.115
##### Modifying Plot Output ··· p.116
#### Device Section ··· p.116
#### File Section ··· p.116
#### Math Section ··· p.117
### Working With Mixed-Mode Simulations ··· p.118
#### From Single-Device to Multidevice Command Files ··· p.118
#### File-Naming Conventions for Mixed Mode ··· p.119
## 4.Performing Numeric Experiments ··· p.121
### Specifying Electrical Boundary Conditions ··· p.121
#### Changing Boundary Condition Type During Simulation ··· p.122
#### Mixed-Mode Electrical Boundary Conditions ··· p.123
### Specifying Thermal Boundary Conditions ··· p.124
### Break Criteria: Conditionally Stopping the Simulation ··· p.125
#### Global Contact Break Criteria ··· p.126
#### Global Device Break Criteria ··· p.126
#### Sweep-Specific Break Criteria ··· p.128
#### Mixed-Mode Break Criteria ··· p.128
### Quasistationary Ramps ··· p.129
#### Ramping Boundary Conditions ··· p.129
#### Ramping Quasi-Fermi Potentials in Doping Wells ··· p.131
#### Ramping Physical Parameter Values ··· p.133
#### Quasistationary in Mixed Mode ··· p.135
#### Saving and Plotting During a Quasistationary ··· p.136
#### Extrapolation ··· p.137
##### Inside a Quasistationary Command ··· p.137
##### Between Quasistationary Commands ··· p.137
##### Parameters of the Extrapolate Statement ··· p.139
### Continuation Command ··· p.141
#### Continuation Control Parameters ··· p.142
#### Continuation in Mixed Mode ··· p.143
### Transient Command ··· p.144
#### Numeric Control of Transient Analysis ··· p.145
#### Time-Stepping ··· p.147
#### Ramping Physical Parameter Values ··· p.148
#### Extrapolation ··· p.149
##### Inside a Transient Command ··· p.149
##### Between Quasistationary Commands ··· p.149
### Transient Ramps ··· p.150
### Large-Signal Cyclic Analysis ··· p.151
#### Description of Method ··· p.152
#### Using Cyclic Analysis ··· p.155
### Small-Signal AC Analysis ··· p.155
#### AC Analysis in Mixed-Mode Simulations ··· p.155
##### Example ··· p.157
#### AC Analysis in Single-Device Mode ··· p.158
#### Optical AC Analysis ··· p.160
### Harmonic Balance ··· p.160
#### Modes of Harmonic Balance Analysis ··· p.161
##### MDFT Mode ··· p.161
##### SDFT Mode ··· p.161
#### Performing Harmonic Balance Analysis ··· p.161
##### Solve Spectrum ··· p.162
##### Convergence Parameters ··· p.163
##### Additional Remarks ··· p.164
#### Nonlinear Solvers ··· p.165
##### Newton Nonlinear Solver ··· p.165
##### GaussSeidel Nonlinear Solver ··· p.165
##### GeneralizedGaussSeidel Nonlinear Solver ··· p.166
#### Handling Traps ··· p.166
##### Frozen Traps Mode ··· p.167
##### Harmonic Traps Mode ··· p.167
##### Decoupled Traps Mode ··· p.167
##### FastSteadyState Traps Mode ··· p.167
#### Harmonic Balance Analysis Output ··· p.168
##### Circuit Currents and Voltages ··· p.168
##### Device Instance Plot Files With CurrentPlot ··· p.168
##### Device Plots ··· p.169
##### Additional Device Plot Variables ··· p.170
##### Output of Individual HBCoupled Statements ··· p.171
#### Application Notes ··· p.171
### References ··· p.171
## 5.Simulation Results ··· p.172
### Current File ··· p.172
#### When to Write to the Current File ··· p.172
##### Example: CurrentPlot Statements ··· p.174
#### NewCurrentPrefix Statement ··· p.174
#### Tracking Additional Data in the Current File ··· p.175
#### CurrentPlot Section ··· p.176
##### Example: Mixed Mode ··· p.178
##### Example: Advanced Options ··· p.178
##### Example: Plotting Parameter Values ··· p.179
##### CurrentPlot Options ··· p.179
#### Tcl Formulas ··· p.180
##### Dataset Option ··· p.181
##### Function Option ··· p.182
##### Unit Option ··· p.182
##### Init Option ··· p.182
##### Formula Option ··· p.182
##### Finish Option ··· p.183
##### Operation Option ··· p.183
##### Examples ··· p.185
### Device Plots ··· p.187
#### What to Plot ··· p.187
#### When to Plot ··· p.188
#### Snapshots ··· p.189
#### Interface Plots ··· p.190
#### Plotting Results Along Carrier Paths ··· p.190
##### Saddle Point Analysis in CIS Devices ··· p.191
#### Log File ··· p.195
### Extraction File ··· p.195
#### Extraction File Format ··· p.195
#### Analysis Modes ··· p.197
#### File Section ··· p.198
#### Electrode Section ··· p.198
#### Extraction Section ··· p.199
#### Solve Section ··· p.199
## 6.Numeric and Software-Related Issues ··· p.201
### Structure of Command File ··· p.201
#### Inserting Files ··· p.201
### Solve Section: How the Simulation Proceeds ··· p.202
### Nonlinear Iterations ··· p.203
#### Coupled Statement ··· p.203
##### Convergence and Error Control ··· p.205
##### Damped Newton Iterations ··· p.207
##### Derivatives ··· p.208
##### Incomplete Newton Algorithm ··· p.208
##### Additional Equations Available in Mixed Mode ··· p.209
##### Selecting Individual Devices in Mixed Mode ··· p.211
##### Relaxed Newton Method ··· p.211
#### Plugin Command ··· p.213
### Linear Solvers ··· p.214
### Nonlocal Meshes ··· p.215
#### Specifying Nonlocal Meshes ··· p.216
#### Visualizing Nonlocal Meshes ··· p.216
#### Visualizing Data Defined on Nonlocal Meshes ··· p.217
#### Constructing Nonlocal Meshes ··· p.218
##### Specification Using Barrier ··· p.218
##### Specification Using a Reference Surface ··· p.219
#### Special Handling of the 1D Schrödinger Equation ··· p.220
#### Special Handling of the Nonlocal Tunneling Model ··· p.220
#### Unnamed Meshes ··· p.221
#### Performance Suggestions ··· p.221
### Monitoring Convergence Behavior ··· p.222
#### PrintRhsPerEquation ··· p.222
#### CNormPrint ··· p.223
#### NewtonPlot ··· p.223
#### Automatic Activation of CNormPrint and NewtonPlot ··· p.224
#### Simulation Statistics for Plotting and Output ··· p.225
##### Simulation Statistics in Current Plot Files ··· p.225
##### Simulation Statistics in Design-of-Experiments Variables ··· p.226
### Save and Load Statements ··· p.227
### Tcl Command File ··· p.229
#### Performing Device Simulations ··· p.229
##### sdevice Command ··· p.232
##### sdevice_init Command ··· p.232
##### sdevice_solve Command ··· p.232
##### sdevice_finish Command ··· p.233
##### sdevice_parameters Command ··· p.233
#### Extracting Parameters ··· p.233
##### Available Inspect Tcl Commands ··· p.234
#### Redirecting Output ··· p.235
#### Known Restrictions ··· p.235
### Parallelization ··· p.235
### Extended Precision ··· p.238
### System Command ··· p.240
### References ··· p.240
# Part II: Physics in Sentaurus Device
## 7.Poisson Equation and Quasi-Fermi Potentials ··· p.243
### Electrostatic Potential ··· p.243
#### Dipole Layer ··· p.244
#### Equilibrium Solution ··· p.245
### Quasi-Fermi Potential With Boltzmann Statistics ··· p.245
### Fermi Statistics ··· p.246
#### Using Fermi Statistics ··· p.247
### Initial Guess for Electrostatic Potential and Quasi-Fermi Potentials in Doping Wells ··· p.248
#### Regionwise Specification of Initial Quasi-Fermi Potentials ··· p.249
### Alternative Initial Guess for Quasi-Fermi Potentials From Linear Conduction Equation ··· p.249
### Electrode Charge Calculation ··· p.251
## 8.Carrier Transport Equations in Semiconductors ··· p.252
### Introduction to Carrier Transport Models ··· p.252
### Drift-Diffusion Model ··· p.253
### Thermodynamic Model for Current Densities ··· p.254
### Hydrodynamic Model for Current Densities ··· p.255
### Numeric Parameters for Current Densities ··· p.255
### Numeric Parameters for Continuity Equation ··· p.256
### Numeric Approaches for Contact Current Computation ··· p.256
### Current Potential ··· p.257
### References ··· p.258
## 9.Lattice and Carrier Temperature Equations ··· p.260
### Introduction to Temperature Equations ··· p.260
### Uniform Self-Heating ··· p.261
#### Using Uniform Self-Heating ··· p.262
### Default Model for Lattice Temperature ··· p.263
### Thermodynamic Model for Lattice Temperature ··· p.264
#### Total Heat and Its Contributions ··· p.264
#### Using the Thermodynamic Model ··· p.265
### Hydrodynamic Model for Temperatures ··· p.267
#### Hydrodynamic Model Parameters ··· p.269
#### Using the Hydrodynamic Model ··· p.270
### Numeric Parameters for Temperature Equations ··· p.271
#### Validity Ranges for Lattice and Carrier Temperatures ··· p.271
#### Scaling of Lattice Heat Generation ··· p.271
### References ··· p.272
## 10. Boundary Conditions ··· p.273
### Electrical Boundary Conditions ··· p.273
#### Ohmic Contacts ··· p.273
#### Modified Ohmic Contacts ··· p.274
#### Contacts on Insulators ··· p.275
#### Schottky Contacts ··· p.276
##### Fermi-Level Pinning at Schottky Contacts ··· p.277
##### Barrier Lowering at Schottky Contacts ··· p.279
#### Resistive Contacts ··· p.285
#### Resistive Contacts in Mixed Mode ··· p.291
#### Resistive Interfaces ··· p.292
#### Boundaries Without Contacts ··· p.294
#### Application Notes ··· p.294
### Floating Contacts ··· p.295
#### Floating Metal Contacts ··· p.295
#### Floating Semiconductor Contacts ··· p.296
#### Floating Contact for Combined Semiconductor and Contact Charges ··· p.298
### Thermal Boundary Conditions ··· p.298
#### Boundary Conditions for Lattice Temperature ··· p.298
#### Boundary Conditions for Carrier Temperatures ··· p.300
### Periodic Boundary Conditions ··· p.300
#### Robin PBC Approach ··· p.301
#### Mortar PBC Approach ··· p.301
#### Specifying Periodic Boundary Conditions ··· p.301
##### Specifying Robin Periodic Boundary Conditions ··· p.301
##### Specifying Mortar Periodic Boundary Conditions ··· p.302
#### Application Notes ··· p.303
##### Specialized Linear Solver for MPBC ··· p.303
### Discontinuous Interfaces ··· p.303
#### Representation of Physical Quantities Across Interfaces ··· p.304
#### Interface Conditions at Discontinuous Interfaces ··· p.304
#### Critical Points ··· p.305
### References ··· p.305
## 11.Transport Equations in Metals, Organic Materials, and Disordered Media ··· p.306
### Singlet Exciton Equation ··· p.306
#### Boundary and Continuity Conditions for Singlet Exciton Equation ··· p.307
#### Using the Singlet Exciton Equation ··· p.308
### Transport in Metals ··· p.310
#### Electric Boundary Conditions for Metals ··· p.311
##### Metal Workfunction ··· p.313
##### Metal Workfunction Randomization ··· p.314
#### Temperature in Metals ··· p.315
### Conductive Insulators ··· p.315
## 12. Semiconductor Band Structure ··· p.320
### Intrinsic Density ··· p.320
### Band Gap and Electron Affinity ··· p.321
#### Selecting the Bandgap Model ··· p.321
#### Bandgap and Electron-Affinity Models ··· p.321
##### Bandgap Narrowing for Bennett–Wilson Model ··· p.322
##### Bandgap Narrowing for Slotboom Model ··· p.323
##### Bandgap Narrowing for del Alamo Model ··· p.323
##### Bandgap Narrowing for Jain–Roulston Model ··· p.323
##### Table Specification of Bandgap Narrowing ··· p.325
##### Schenk Bandgap Narrowing Model ··· p.326
##### Bandgap Narrowing With Incomplete Ionization ··· p.330
##### Bandgap Narrowing With Fermi Statistics ··· p.331
##### Band Gap and Parameters of Non-Three-Dimensional Density-of-States ··· p.332
#### Bandgap Parameters ··· p.333
### Effective Masses and Effective Density-of-States ··· p.334
#### Electron Effective Mass and Density-of-States ··· p.335
##### Formula=1 ··· p.335
##### Formula=2 ··· p.335
#### Electron Effective Mass and Conduction Band DOS Parameters ··· p.335
#### Hole Effective Mass and Density-of-States ··· p.336
##### Formula=1 ··· p.336
##### Formula=2 ··· p.336
#### Hole Effective Mass and Valence Band DOS Parameters ··· p.337
### Gaussian Density-of-States for Organic Semiconductors ··· p.337
### Band Tails ··· p.340
### Multivalley Band Structure ··· p.342
#### Nonparabolic Band Structure ··· p.343
#### Bandgap Widening ··· p.344
#### Monte Carlo Density-of-States ··· p.345
#### Non-Three-Dimensional Density-of-States ··· p.345
##### Graphene Nanoribbon Density-of-States ··· p.346
##### Carbon Nanotube Density-of-States ··· p.346
#### Using Multivalley Band Structure ··· p.346
#### Intervalley Transitions ··· p.351
##### Intervalley Transition Rate Models ··· p.352
##### Solving the Intervalley Transition Rate Equation ··· p.354
### References ··· p.356
## 13. Incomplete Ionization ··· p.358
### Considering Incomplete Ionization ··· p.358
### Using the Incomplete Ionization Model ··· p.358
#### Incomplete Ionization Model ··· p.359
### Physical Model Parameters ··· p.362
### Multiple Lattice Sites ··· p.364
### References ··· p.366
## 14. Quantization ··· p.367
### Modeling Quantization Effects ··· p.367
### The van Dort Model ··· p.368
#### Using the van Dort Model ··· p.369
### 1D Schrödinger Equation ··· p.370
#### Nonlocal Mesh for the 1D Schrödinger Equation ··· p.370
#### Using the 1D Schrödinger Equation ··· p.371
#### Parameters of the 1D Schrödinger Equation ··· p.371
##### Explicitly Specifying Ladders ··· p.372
##### Automatically Extracting Ladder Parameters ··· p.372
#### Visualizing the Solutions ··· p.374
#### 1D Schrödinger Equation ··· p.374
#### Notes on the Use of the 1D Schrödinger Equation ··· p.375
### External 2D Schrödinger Solver ··· p.376
#### Notes on the Use of External 2D Schrödinger Solvers ··· p.378
### External Boltzmann Solver ··· p.378
### Density Gradient Model ··· p.380
#### Using the Density Gradient Model ··· p.382
##### Named Parameter Sets for the Density Gradient Model ··· p.385
##### Auto-Orientation for the Density Gradient Model ··· p.385
#### Notes on the Use of the Density Gradient Model ··· p.386
### Modified Local-Density Approximation Model ··· p.388
#### Interface Orientation and Stress Dependencies ··· p.389
#### Heterojunctions ··· p.390
#### Nonparabolic Bands and Geometric Quantization ··· p.391
#### Using the MLDA Model ··· p.392
#### Notes on the Use of the MLDA Model ··· p.396
### Quantum-Well Quantization Model ··· p.396
### Extracting Layer Thickness ··· p.398
#### Combining LayerThickness Command and ThinLayer Subcommand ··· p.398
#### Geometric Parameters of LayerThickness Command ··· p.399
##### Thickness Extraction ··· p.400
### References ··· p.402
## 15. Mobility ··· p.404
### Introduction to Mobility Models ··· p.404
#### Combining Mobility Models ··· p.404
### Mobility due to Phonon Scattering ··· p.405
### Doping-Dependent Mobility Degradation ··· p.406
#### Using Doping-Dependent Mobility ··· p.406
##### Using More Than One Doping-Dependent Mobility Model ··· p.407
#### Masetti Model ··· p.407
#### Arora Model ··· p.408
#### University of Bologna Bulk Mobility Model ··· p.409
#### The pmi_msc_mobility Model ··· p.411
#### PMIs for Bulk Mobility ··· p.412
#### Low-Field Ballistic Mobility Models ··· p.413
##### Simple Channel Length–Dependent Ballistic Mobility Model ··· p.413
##### Injection Velocity–Dependent Ballistic Mobility Model ··· p.413
### Carrier–Carrier Scattering ··· p.414
#### Using Carrier–Carrier Scattering ··· p.415
#### Conwell–Weisskopf Model ··· p.415
#### Brooks–Herring Model ··· p.415
#### Physical Model Parameters ··· p.416
### Philips Unified Mobility Model ··· p.416
#### Using the Philips Unified Mobility Model ··· p.416
#### Using an Alternative Philips Unified Mobility Model ··· p.417
#### Description of the Philips Unified Mobility Model ··· p.417
#### Screening Parameter ··· p.419
#### Philips Model Parameters ··· p.419
### Mobility Degradation at Interfaces ··· p.421
#### Using Mobility Degradation at Interfaces ··· p.421
#### Enhanced Lombardi Model ··· p.422
##### Stress Factors for Mobility Components ··· p.425
##### Named Parameter Sets for the Lombardi Model ··· p.425
##### Auto-Orientation for the Lombardi Model ··· p.426
#### Inversion and Accumulation Layer Mobility Model ··· p.426
##### Coulomb Scattering ··· p.427
##### Phonon Scattering ··· p.429
##### Surface Roughness Scattering ··· p.429
##### Parameters ··· p.430
##### Stress Factors for Mobility Components ··· p.433
##### Using the Inversion and Accumulation Layer Mobility Model ··· p.433
##### Named Parameter Sets for the IALMob Model ··· p.434
##### Auto-Orientation for the IALMob Model ··· p.434
#### University of Bologna Surface Mobility Model ··· p.435
#### Mobility Degradation Components due to Coulomb Scattering ··· p.437
##### Stress Factors for Mobility Components ··· p.439
##### Using Mobility Degradation Components ··· p.439
#### Remote Coulomb Scattering Model ··· p.441
##### Stress Factors for Mobility Components ··· p.443
#### Remote Phonon Scattering Model ··· p.443
##### Stress Factors for Mobility Components ··· p.444
#### Computing Transverse Field ··· p.444
##### Normal to the Interface ··· p.444
##### Normal to the Current Flow ··· p.445
##### Field Correction on Interface ··· p.446
### Thin-Layer Mobility Model ··· p.446
#### Using the Thin-Layer Mobility Model ··· p.448
##### Physical Parameters ··· p.448
##### Stress Factors for Mobility Components ··· p.450
##### Auto-Orientation and Named Parameter Sets ··· p.450
##### Geometric Parameters ··· p.451
### Carbon Nanotube Mobility Model ··· p.451
#### Using the CNT Mobility Model ··· p.452
### Low-Temperature Phonon Exponent Correction for Mobility Models ··· p.453
#### Constant Mobility Model ··· p.454
#### Philips Unified Mobility Model ··· p.455
#### Enhanced Lombardi Mobility Model ··· p.455
#### Inversion and Accumulation Layer Mobility Model ··· p.456
### High-Field Saturation Models ··· p.457
#### Using High-Field Saturation Models ··· p.457
##### Named Parameter Sets for the High-Field Saturation Models ··· p.458
##### Auto-Orientation for the High-Field Saturation Models ··· p.458
#### Extended Canali Model ··· p.459
#### Transferred Electron Model ··· p.460
#### Transferred Electron Model 2 ··· p.461
#### Multivalley Transferred Electron Mobility ··· p.463
#### Explicit Multivalley Mobility Model ··· p.463
#### Basic Model ··· p.464
#### Meinerzhagen–Engl Model ··· p.464
#### Physical Model Interfaces ··· p.465
#### Lucent Model ··· p.465
#### Velocity Saturation Models ··· p.466
##### Selecting Velocity Saturation Models ··· p.466
#### Density-Dependent Velocity Saturation Model ··· p.466
#### Driving Force Models ··· p.468
##### Electric Field Parallel to the Current ··· p.468
##### Gradient of Quasi-Fermi Potential ··· p.468
##### Electric Field Parallel to the Interface ··· p.469
##### Hydrodynamic Driving Force ··· p.470
##### Electric Field ··· p.471
##### Interpolation of Driving Forces to Zero Field ··· p.471
##### Interpolation of the GradQuasiFermi Driving Force ··· p.471
##### Interpolation of the Eparallel Driving Force ··· p.472
##### Field Correction Close to Interfaces ··· p.473
#### Non-Einstein Diffusivity ··· p.473
#### Band Tail Mobility ··· p.474
#### High-Field Saturation Mobility Scaling ··· p.475
### High-Field Mobility in Disordered Materials ··· p.476
#### Poole–Frenkel Mobility ··· p.476
#### Variable Range Hopping Transport Mobility ··· p.477
### Ballistic Mobility Model ··· p.478
#### Channel Length–Dependent Model ··· p.479
#### Kinetic Velocity Model ··· p.479
#### Fermi–Dirac Statistics ··· p.480
#### Frensley Rule ··· p.481
#### Using the Ballistic Mobility Model ··· p.481
#### Using the PMI Fitting Parameter in the Ballistic Mobility Model ··· p.482
### General Model for Mobility Degradation by Traps in the Bulk and at Semiconductor Interfaces ··· p.482
### Incomplete Ionization–Dependent Mobility Models ··· p.484
### Mobility Averaging ··· p.485
### Mobility Doping File ··· p.485
### Effective Mobility ··· p.486
#### EffectiveMobility PMI Methods ··· p.487
#### Using the EffectiveMobility PMI ··· p.488
### References ··· p.490
## 16. Generation–Recombination ··· p.493
### Shockley–Read–Hall Recombination ··· p.493
#### Using SRH Recombination ··· p.494
#### SRH Doping Dependence ··· p.494
#### Lifetime Profiles From Files ··· p.495
#### Improved Nakagawa Model ··· p.495
#### SRH Temperature Dependence ··· p.496
#### SRH Doping- and Temperature-Dependent Parameters ··· p.497
#### SRH Field Enhancement ··· p.497
##### Using Field Enhancement ··· p.498
##### Schenk Trap-Assisted Tunneling Model ··· p.499
##### Hurkx Trap-Assisted Tunneling Model ··· p.500
##### Density Correction for Schenk and Hurkx Trap-Assisted Tunneling Models ··· p.501
#### Dynamic Nonlocal Path Trap-Assisted Tunneling ··· p.501
##### Recombination Rate ··· p.502
##### Using the Dynamic Nonlocal Path Trap-Assisted Tunneling Model ··· p.503
#### Trap-Assisted Auger Recombination Model ··· p.505
### Surface SRH Recombination Model ··· p.506
### Coupled Defect Level Recombination ··· p.507
#### Using Coupled Defect Level Recombination ··· p.508
### Radiative Recombination Model ··· p.508
#### Using the Radiative Recombination Model ··· p.509
### Auger Recombination Model ··· p.509
#### Using the Auger Recombination Model ··· p.510
### Intrinsic Recombination Model for Silicon ··· p.510
### Constant Carrier Generation Model ··· p.513
### Avalanche Generation ··· p.514
#### Using Avalanche Generation ··· p.515
#### van Overstraeten – de Man Model ··· p.517
#### Okuto–Crowell Model ··· p.518
#### Lackner Model ··· p.519
#### University of Bologna Impact Ionization Model ··· p.520
#### New University of Bologna Impact Ionization Model ··· p.522
#### Hatakeyama Avalanche Model ··· p.524
##### Driving Force of Hatakeyama Avalanche Model ··· p.526
##### Default Anisotropic Coordinate System ··· p.526
##### Specification of Anisotropic Direction ··· p.527
#### Driving Force ··· p.528
##### Interpolation of Avalanche Driving Forces ··· p.529
#### Avalanche Generation With Hydrodynamic Transport ··· p.529
### Off-State Breakdown Analysis ··· p.531
#### Using Off-State Breakdown Analysis ··· p.531
### Approximate Breakdown Analysis ··· p.532
#### Using Breakdown Analysis ··· p.532
##### Stopping Criteria for Breakdown Simulations ··· p.536
##### Visualizing Breakdown Paths ··· p.536
##### Typical Command File of Sentaurus Device ··· p.537
#### Approximate Breakdown Analysis With Carriers ··· p.538
##### Using GradQuasiFermi as a Driving Force ··· p.538
### Avalanche Breakdown Probability ··· p.539
#### Using Avalanche Breakdown Probability ··· p.539
### High-Field Entrance Position and Time ··· p.540
#### Using High-Field Entrance Position and Time ··· p.540
#### Visualization in TDR Files ··· p.543
##### Save Volume Dataset in Existing TDR File ··· p.543
##### Save Carrier Paths as 1D Datasets in Separate TDR File ··· p.543
### Band-to-Band Tunneling Models ··· p.544
#### Using Band-to-Band Tunneling ··· p.545
##### Tunneling Near Interfaces and Equilibrium Regions ··· p.546
#### Schenk Band-to-Band Tunneling Model ··· p.547
##### Schenk Density Correction ··· p.548
#### Hurkx Band-to-Band Tunneling Model ··· p.548
#### Modified Hurkx Band-to-Band Tunneling Model ··· p.549
#### Simple Band-to-Band Tunneling Models ··· p.550
#### Dynamic Nonlocal Path Band-to-Band Tunneling Model ··· p.550
##### Band-to-Band Generation Rate ··· p.551
##### Using the Nonlocal Path Band-to-Band Tunneling Model ··· p.554
##### Handling Derivatives ··· p.556
##### Tunneling Parameters From the Physical Model Interface ··· p.557
##### Energy Shift due to Geometric Confinement ··· p.557
##### Postprocessing Mode ··· p.558
##### Frozen Tunneling Direction ··· p.558
##### Visualizing Nonlocal Band-to-Band Generation Rate ··· p.558
### Bimolecular Recombination Model ··· p.559
#### Using the Bimolecular Recombination Model ··· p.559
### Exciton Dissociation Model ··· p.560
#### Using the Exciton Dissociation Model ··· p.560
### References ··· p.561
## 17. Traps and Fixed Charges ··· p.564
### Introduction to Traps ··· p.564
#### Syntax for Traps ··· p.564
#### Trap Types ··· p.565
#### Energetic and Spatial Distribution of Traps ··· p.565
#### Specifying Single Traps ··· p.569
#### Trap Randomization ··· p.570
#### Explicit Trap Occupation ··· p.571
#### Options to Include Traps in Doping ··· p.573
#### Trap Examples ··· p.573
### Trap Models ··· p.574
#### Trap Occupation Dynamics ··· p.574
#### Local Capture and Emission Rates ··· p.576
##### J-Model for Cross Sections ··· p.577
##### Hurkx Model for Cross Sections ··· p.578
##### Poole–Frenkel Model for Cross Sections ··· p.578
##### Makram-Ebeid–Lannoo Model ··· p.580
##### Local Capture and Emission Rates From PMI ··· p.582
#### Trap-to-Trap Tunneling (DiscreteTrapT2T) ··· p.582
##### Mode Oscillator Model ··· p.588
##### Inelastic Phonon Model ··· p.589
##### Trap-to-Trap Recombination ··· p.592
##### Trap-to-Trap Flux of InelasticPhonon Model ··· p.593
##### Coulomb Potential–Induced Barrier Lowering for Inelastic Phonon Trap-to-Trap Tunneling ··· p.594
#### Nonlocal Tunneling for Traps ··· p.597
##### Electron Capture Rate for the Phonon-Assisted Transition ··· p.597
##### Electron Capture Rate for the Elastic Transition ··· p.598
### Numeric Parameters for Traps ··· p.599
### Visualizing Traps ··· p.599
### Insulator Fixed Charges ··· p.603
### References ··· p.604
## 18. Phase and State Transitions ··· p.605
### Multistate Configurations and Their Dynamic ··· p.605
### Specifying Multistate Configurations ··· p.607
#### Multistate Configurations on Interfaces ··· p.608
#### Additional Remarks ··· p.608
### Transition Models ··· p.609
#### The pmi_ce_msc Model ··· p.609
##### States ··· p.610
##### Transitions ··· p.610
##### Model Parameters ··· p.613
### Interaction of Multistate Configurations With Transport ··· p.615
#### Apparent Band-Edge Shift ··· p.616
##### The pmi_msc_abes Model ··· p.616
#### Thermal Conductivity, Heat Capacity, and Mobility ··· p.617
### Manipulating MSCs During Solve ··· p.618
#### Explicit State Occupations ··· p.618
#### Manipulating Transition Dynamics ··· p.619
### Example: Two-State Phase-Change Memory Model ··· p.619
### References ··· p.620
## 19. Degradation ··· p.621
### Overview of Degradation Models ··· p.621
### Trap Degradation Model ··· p.622
#### Trap Formation Kinetics ··· p.622
##### Power Law and Kinetic Equation ··· p.622
##### Si-H Density–Dependent Activation Energy ··· p.623
##### Diffusion of Hydrogen in Oxide ··· p.624
#### Model Equations and Syntax ··· p.624
##### Reaction Enhancement Factors ··· p.626
##### Using the Trap Degradation Model ··· p.627
#### Device Lifetime and Simulation ··· p.628
#### Degradation in Insulators ··· p.630
### Fluence Model ··· p.632
### MSC–Hydrogen Transport Degradation Model ··· p.632
#### Hydrogen Transport ··· p.633
##### Boundary Conditions ··· p.634
#### Reactions Between Mobile Elements ··· p.635
#### Reactions With Multistate Configurations ··· p.637
#### The CEModel_Depassivation Model ··· p.638
#### Using MSC–Hydrogen Transport Degradation Model ··· p.641
##### Changing Charge and Hydrogen Composition of Species ··· p.643
### Two-Stage NBTI Degradation Model ··· p.643
#### Formulation ··· p.644
#### Using Two-Stage NBTI Model ··· p.646
### Extended Nonradiative Multiphonon Model ··· p.647
#### eNMP Model Description ··· p.648
#### Using the eNMP Model ··· p.650
##### eNMP Quantities Available for Plotting ··· p.651
##### eNMP Model Parameters ··· p.652
##### eNMP Transition Rates PMI Model ··· p.653
### Hot-Carrier Stress Degradation Model ··· p.653
#### Model Description ··· p.653
##### Single-Particle and Multiple-Particle Interface-Trap Densities ··· p.654
##### Field-Enhanced Thermal Degradation ··· p.655
##### Carrier Distribution Function ··· p.656
##### Bond Dispersion ··· p.657
##### Time-Dependent Hot-Carrier Stress Degradation Model ··· p.658
#### Using the HCS Degradation Model ··· p.659
### Activated Barrier Double Well Thermionic Model ··· p.661
#### Model Description ··· p.661
#### Using the ABDWT Model ··· p.662
### Transient Trap Occupancy Model ··· p.664
#### Model Description ··· p.664
#### Using the Transient Trap Occupancy Model ··· p.665
### References ··· p.667
## 20. Organic Devices ··· p.669
### Introduction to Organic Device Simulation ··· p.669
### References ··· p.671
## 21. Optical Generation ··· p.672
### Overview of Optical Generation ··· p.672
### Specifying the Type of Optical Generation Computation ··· p.673
#### Optical Generation From Monochromatic Source ··· p.675
#### Illumination Spectrum ··· p.675
##### Multidimensional Illumination Spectra ··· p.676
##### Enhanced Spectrum Control ··· p.677
#### Loading and Saving Optical Generation From and to Files ··· p.680
#### Constant Optical Generation ··· p.681
#### Quantum Yield Models ··· p.682
##### Optical Absorption Heat ··· p.684
#### Specifying Time Dependency for Transient Simulations ··· p.685
##### Optical Turning Points ··· p.691
### Solving the Optical Problem ··· p.692
#### Specifying the Optical Solver ··· p.693
##### Transfer Matrix Method Solver ··· p.693
##### Finite-Difference Time-Domain Solver ··· p.694
##### Raytracing ··· p.696
##### Beam Propagation Method ··· p.697
##### Loading Solution of Optical Problem From File ··· p.697
##### Optical Beam Absorption Method ··· p.698
##### Composite Method ··· p.698
#### Setting the Excitation Parameters ··· p.699
##### Illumination Window ··· p.701
##### Spatial Intensity Function Excitation ··· p.709
#### Choosing Refractive Index Model ··· p.711
#### Extracting the Layer Stack ··· p.711
#### Controlling Computation of Optical Problem in Solve Section ··· p.712
### Parameter Ramping ··· p.714
### Accurate Absorbed Photon Density for 1D Optical Solvers ··· p.716
### Complex Refractive Index Model ··· p.718
#### Physical Model ··· p.719
##### Wavelength Dependency ··· p.719
##### Temperature Dependency ··· p.720
##### Carrier Dependency ··· p.720
##### Gain Dependency ··· p.721
#### Using Complex Refractive Index ··· p.722
### Raytracing ··· p.727
#### Raytracer ··· p.727
#### Ray Photon Absorption and Optical Generation ··· p.729
#### Using the Raytracer ··· p.730
#### Terminating Raytracing ··· p.731
#### Monte Carlo Raytracing ··· p.732
#### Multithreading for Raytracer ··· p.733
#### Compact Memory Model for Raytracer ··· p.733
#### Window of Starting Rays ··· p.734
##### User-Defined Window of Rays ··· p.734
##### Distribution Window of Rays ··· p.735
#### Cylindrical Coordinates for Raytracing ··· p.737
#### Boundary Condition for Raytracing ··· p.738
##### Fresnel Boundary Condition ··· p.739
##### Constant Reflectivity and Transmittivity Boundary Condition ··· p.740
##### Raytrace PMI Boundary Condition ··· p.741
##### Thin-Layer-Stack Boundary Condition ··· p.741
##### TMM Optical Generation in Raytracer ··· p.743
##### Diffuse Surface Boundary Condition ··· p.744
##### Periodic Boundary Condition ··· p.747
#### Virtual Regions in Raytracer ··· p.748
#### External Material in Raytracer ··· p.748
#### Additional Options for Raytracing ··· p.749
#### Redistributing Power of Stopped Rays ··· p.749
#### Weighted Interpolation for Raytrace Optical Generation ··· p.750
#### Visualizing Raytracing ··· p.750
#### Computing Optical Intensity ··· p.751
#### Reporting Various Powers in Raytracing ··· p.751
#### Plotting Interface Flux ··· p.752
#### Far Field and Sensors for Raytracing ··· p.754
#### Dual-Grid Setup for Raytracing ··· p.757
### Transfer Matrix Method ··· p.759
#### Physical Model ··· p.759
##### Current Plot Quantities ··· p.761
##### Rough Surface Scattering ··· p.761
#### Using Transfer Matrix Method ··· p.764
##### Using Scattering Solver ··· p.766
### Loading Solution of Optical Problem From Files ··· p.774
#### Importing 1D Profiles Into Higher-Dimensional Grids ··· p.777
#### Ramping Profile Index ··· p.777
### Optical Beam Absorption Method ··· p.778
#### Physical Model ··· p.779
#### Using Optical Beam Absorption Method ··· p.780
### Beam Propagation Method ··· p.781
#### Physical Model ··· p.781
##### Bidirectional BPM ··· p.782
##### Boundary Conditions ··· p.782
#### Using Beam Propagation Method ··· p.783
##### General ··· p.783
##### Bidirectional BPM ··· p.784
##### Excitation ··· p.785
##### Boundary ··· p.788
##### Ramping Input Parameters ··· p.788
##### Visualizing Results on Native Tensor Grid ··· p.789
### Composite Method ··· p.790
#### Using the Composite Method ··· p.790
### Controlling Interpolation When Loading Optical Generation Profiles ··· p.793
### Optical AC Analysis ··· p.795
### References ··· p.796
## 22. Radiation ··· p.797
### Carrier Generation by Gamma Radiation ··· p.797
#### Yield Function ··· p.798
### Carrier Generation by Alpha Particles ··· p.798
#### Using the Alpha Particle Model ··· p.799
### Carrier Generation by Heavy Ions ··· p.800
#### Using the Heavy Ion Model ··· p.801
#### Examples: Heavy Ions ··· p.804
##### Example 1 ··· p.804
##### Example 2 ··· p.804
##### Example 3 ··· p.805
### References ··· p.805
## 23. Noise, Fluctuations, and Sensitivity ··· p.806
### Using the Impedance Field Method ··· p.806
#### Specifying Variations ··· p.807
#### Specifying the Solver ··· p.808
#### Analysis at Frequency Zero ··· p.808
#### Output of Results ··· p.809
### Noise Sources ··· p.812
#### Common Options ··· p.812
#### Diffusion Noise ··· p.812
#### Equivalent Monopolar Generation–Recombination Noise ··· p.813
#### Bulk Flicker Noise ··· p.813
#### Trapping Noise ··· p.814
#### Random Dopant Fluctuations ··· p.815
#### Random Geometric Fluctuations ··· p.815
#### Random Trap Concentration Fluctuations ··· p.818
#### Random Workfunction Fluctuations ··· p.818
#### Random Band Edge Fluctuations ··· p.819
#### Random Metal Conductivity Fluctuations ··· p.820
#### Random Dielectric Constant Fluctuations ··· p.821
#### Noise From SPICE Circuit Elements ··· p.821
### Statistical Impedance Field Method ··· p.821
#### Options Common to sIFM Variations ··· p.823
#### Spatial Correlations and Random Fields ··· p.824
#### Doping Variations ··· p.826
#### Trap Concentration Variations ··· p.827
#### Workfunction Variations ··· p.827
#### Geometric Variations ··· p.828
#### Band Edge Variations ··· p.829
#### Metal Conductivity Variations ··· p.830
#### Dielectric Constant Variations ··· p.831
#### Doping Profile Variations ··· p.832
### Deterministic Variations ··· p.833
#### Deterministic Doping Variations ··· p.833
#### Deterministic Geometric Variations ··· p.835
#### Parameter Variations ··· p.836
### IFM Section ··· p.837
### Impedance Field Method ··· p.838
### Noise Output Data ··· p.839
### References ··· p.843
## 24. Tunneling ··· p.844
### Overview of Tunneling Models ··· p.844
### Fowler–Nordheim Tunneling ··· p.845
#### Using Fowler–Nordheim ··· p.845
#### Fowler–Nordheim Model ··· p.846
#### Fowler–Nordheim Parameters ··· p.847
### Direct Tunneling ··· p.847
#### Using Direct Tunneling ··· p.848
#### Direct Tunneling Model ··· p.848
##### Temperature-Dependent Barrier Height ··· p.849
##### Image Force Effect ··· p.849
#### Direct Tunneling Parameters ··· p.851
### Nonlocal Tunneling at Interfaces, Contacts, and Junctions ··· p.852
#### Defining Nonlocal Meshes ··· p.852
#### Specifying Nonlocal Tunneling Model ··· p.854
#### Nonlocal Tunneling Parameters ··· p.855
#### Visualizing Nonlocal Tunneling ··· p.858
#### Physics of Nonlocal Tunneling Model ··· p.858
##### WKB Tunneling Probability ··· p.858
##### Schrödinger Equation–Based Tunneling Probability ··· p.862
##### Density Gradient Quantization Correction ··· p.862
##### Multivalley Band Structure and Geometric Quantization ··· p.863
##### Nonlocal Tunneling Current ··· p.864
##### Band-to-Band Contributions to Nonlocal Tunneling Current ··· p.866
##### Carrier Heating ··· p.867
### References ··· p.868
## 25. Hot-Carrier Injection ··· p.869
### Overview of Hot-Carrier Injection Models ··· p.869
#### Destination of Injected Current ··· p.870
#### Injection Barrier and Image Potential ··· p.872
#### Effective Field ··· p.874
### Classical Lucky Electron Injection ··· p.875
#### Scattering Mean Free Path in Semiconductor From Physical Model Interface ··· p.876
### Fiegna Hot-Carrier Injection ··· p.876
### SHE Distribution Hot-Carrier Injection ··· p.878
#### Spherical Harmonics Expansion Method ··· p.879
#### Using Spherical Harmonics Expansion Method ··· p.883
#### Visualizing Spherical Harmonics Expansion Method ··· p.891
### Carrier Injection With Explicitly Evaluated Boundary Conditions for Continuity Equations ··· p.893
### References ··· p.894
## 26. Heterostructure Device Simulation ··· p.896
### Thermionic Emission Current ··· p.896
#### Using Thermionic Emission Current ··· p.896
#### Thermionic Emission Model ··· p.897
#### Thermionic Emission Model With Fermi Statistics ··· p.898
### Gaussian Transport Across Organic Heterointerfaces ··· p.899
#### Using Gaussian Transport at Organic Heterointerfaces ··· p.899
#### Gaussian Transport at Organic Heterointerface Model ··· p.900
### References ··· p.900
## 27. Energy-Dependent Parameters ··· p.901
### Overview ··· p.901
### Energy-Dependent Energy Relaxation Time ··· p.902
#### Spline Interpolation ··· p.903
### Energy-Dependent Mobility ··· p.904
#### Spline Interpolation ··· p.905
### Energy-Dependent Peltier Coefficient ··· p.906
#### Spline Interpolation ··· p.908
## 28. Anisotropic Properties ··· p.909
### Anisotropic Properties of Semiconductor Devices ··· p.909
#### Anisotropic Approximations ··· p.910
##### TensorGridAniso ··· p.910
##### AnisoSG ··· p.911
##### StressSG ··· p.911
##### AverageAniso ··· p.912
### Crystal and Simulation Coordinate Systems ··· p.912
### Anisotropy Definition and Specification ··· p.913
#### Anisotropic Direction in 3D Cases ··· p.913
#### Anisotropic Direction in 2D Cases ··· p.914
##### Aniso Subsection With Direction Definition ··· p.914
##### Aniso Subsection Without Direction Definition ··· p.916
#### Aniso(direction) Versus LatticeParameters ··· p.918
#### Orthogonal Matrix From Eigenvectors Q ··· p.919
### Anisotropic Mobility ··· p.919
#### Anisotropy Factor ··· p.919
#### Current Densities ··· p.920
#### Driving Forces ··· p.921
#### Total Anisotropic Mobility ··· p.922
#### Self-Consistent Anisotropic Mobility ··· p.922
#### Anisotropic Mobility Visualization ··· p.924
### Anisotropic Metal Resistivity ··· p.924
#### Total Anisotropic Metal Resistivity Factor ··· p.925
#### Self-Consistent Anisotropic Metal Resistivity ··· p.925
### Anisotropic Avalanche Generation ··· p.925
### Anisotropic Electrical Permittivity ··· p.927
### Anisotropic Thermal Conductivity ··· p.929
### Anisotropic Density Gradient Model ··· p.930
#### Anisotropic Directions for Density Gradient Model ··· p.930
## 29. Ferroelectric Materials ··· p.932
### Using Ferroelectrics ··· p.932
### Ferroelectrics Model ··· p.935
### Ginzburg–Landau–Khalatnikov Equation ··· p.937
#### Using the Ginzburg–Landau–Khalatnikov Equation ··· p.939
#### Versions of the Solver ··· p.942
##### Default ··· p.942
##### Multidimensional ··· p.943
##### Solver II ··· p.944
#### Bitlis Solver ··· p.945
### References ··· p.947
## 30. Ferromagnetism and Spin Transport ··· p.948
### Brief Introduction to Spintronics ··· p.948
### Transport Through Magnetic Tunnel Junctions ··· p.949
#### Magnetic Direct Tunneling Model ··· p.949
#### Using the Magnetic Direct Tunneling Model ··· p.950
#### Physics Parameters for Magnetic Direct Tunneling ··· p.950
#### Math Parameters for Magnetic Direct Tunneling ··· p.951
### Magnetization Dynamics ··· p.952
#### Spin Dynamics of a Free Electron in a Magnetic Field ··· p.953
#### Magnetization Dynamics in a Ferromagnetic Layer ··· p.953
#### Contributions of the Magnetic Energy Density ··· p.954
#### Energy Density and Effective Field in Macrospin Approximation ··· p.955
#### Using Magnetization Dynamics in Device Simulations ··· p.956
##### Domain Selection and Initial Conditions ··· p.956
##### Plotting Time-Dependent Magnetization ··· p.957
#### Parameters for Magnetization Dynamics ··· p.957
#### Time-Step Control for Magnetization Dynamics ··· p.958
### Thermal Fluctuations ··· p.958
#### Using Thermal Fluctuations ··· p.958
### Parallel and Perpendicular Spin Transfer Torque ··· p.959
### Magnetization Dynamics Beyond Macrospin: Position-Dependent Exchange and Spin Waves ··· p.959
#### Using Position-Dependent Exchange ··· p.960
### User-Defined Contributions to Effective Magnetic Field of LLG Equation ··· p.961
### References ··· p.961
## 31. Mechanical Stress ··· p.962
### Stress and Strain in Semiconductors ··· p.962
#### Using Stress and Strain ··· p.964
##### Stress Tensor ··· p.965
##### Strain Tensor ··· p.966
##### Stress Limits ··· p.966
##### Crystallographic Orientation and Compliance Coefficients ··· p.966
### Deformation of Band Structure ··· p.967
#### Bir and Pikus Model ··· p.967
#### Linear Deformation Model ··· p.968
#### k·p Models ··· p.968
#### Using Deformation Potential Model ··· p.970
#### Strained Effective Masses and Density-of-States ··· p.972
##### Strained Electron Effective Mass and DOS ··· p.972
##### Strained Hole Effective Mass and DOS ··· p.975
##### Using Strained Effective Masses and DOS ··· p.976
#### Multivalley Band Structure ··· p.977
##### Using Multivalley Band Structure ··· p.978
### Mobility Modeling ··· p.980
#### Multivalley Electron Mobility Model ··· p.981
##### Intervalley Scattering ··· p.982
##### Effective Mass ··· p.984
##### Inversion Layer ··· p.985
##### Using Multivalley Electron Mobility Model ··· p.987
#### Multivalley Hole Mobility Model ··· p.990
##### Effective Mass ··· p.991
##### Scattering ··· p.991
##### Using Multivalley Hole Mobility Model ··· p.993
#### Multivalley Ballistic Mobility Model ··· p.995
##### Using Multivalley Ballistic Mobility Model ··· p.996
#### Multivalley Transferred Carrier Mobility Model ··· p.997
##### Using Multivalley Transferred Carrier Mobility Model ··· p.998
#### Intel Stress-Induced Hole Mobility Model ··· p.998
##### Stress Dependencies ··· p.999
##### Generalization of Model ··· p.1000
##### Using Intel Mobility Model ··· p.1001
#### Piezoresistance Mobility Model ··· p.1002
##### Doping and Temperature Dependency ··· p.1005
##### Using Piezoresistance Mobility Model ··· p.1005
##### Named Parameter Sets for Piezoresistance ··· p.1007
##### Auto-Orientation for Piezoresistance ··· p.1007
##### Enormal- and MoleFraction-Dependent Piezo Coefficients ··· p.1008
##### Using Piezoresistive Prefactors Model ··· p.1008
#### Isotropic Factor Models ··· p.1014
##### Using Isotropic Factor Models ··· p.1015
##### Piezoresistance Factor Models ··· p.1015
##### Effective Stress Model ··· p.1016
##### Mobility Stress Factor PMI Model ··· p.1019
##### SFactor Dataset or PMI Model ··· p.1020
##### Isotropic Factor Model Options ··· p.1020
##### Factor Models Applied to Mobility Components ··· p.1020
#### Stress Mobility Model for Minority Carriers ··· p.1021
#### Dependency of Saturation Velocity on Stress ··· p.1023
#### Mobility Enhancement Limits ··· p.1024
#### Plotting Mobility Enhancement Factors ··· p.1025
### Numeric Approximations for Tensor Mobility ··· p.1025
#### Tensor Grid Option ··· p.1025
#### Stress Tensor Applied to Low-Field Mobility ··· p.1026
### Piezoelectric Polarization ··· p.1027
#### Strain Model ··· p.1027
##### Simplified Strain Model ··· p.1028
#### Stress Model ··· p.1028
#### Poisson Equation ··· p.1029
#### Parameter File ··· p.1030
#### Coordinate Systems ··· p.1030
#### Converse Piezoelectric Field ··· p.1031
#### Piezoelectric Datasets ··· p.1032
##### Discontinuous Piezoelectric Charge at Heterointerfaces ··· p.1032
#### Gate-Dependent Polarization in GaN Devices ··· p.1032
##### Two-Dimensional Simulations ··· p.1033
### Mechanics Solver ··· p.1033
#### Options for the Stress Solver ··· p.1035
### References ··· p.1037
## 32. Galvanic Transport ··· p.1040
### Model Description ··· p.1040
#### Using Galvanic Transport Model ··· p.1040
### Discretization Scheme for Continuity Equations ··· p.1041
### References ··· p.1041
## 33. Thermal Properties ··· p.1042
### Heat Capacity ··· p.1042
#### The pmi_msc_heatcapacity Model ··· p.1043
### Thermal Conductivity ··· p.1044
#### The AllDependent Thermal Conductivity Model ··· p.1045
##### Bulk Thermal Conductivity Computation ··· p.1046
##### Bulk Relaxation Time With Doping ··· p.1048
##### Thin-Layer Relaxation Time ··· p.1052
##### Mole Fraction–Dependent Relaxation Time ··· p.1053
#### The ConnellyThermalConductivity Model ··· p.1053
##### Layer Thickness Computation ··· p.1054
##### Bulk Thermal Conductivity Computation ··· p.1054
#### The pmi_msc_thermalconductivity Model ··· p.1056
### Thermoelectric Power ··· p.1057
#### Physical Models ··· p.1057
##### Table-Based TEPower Model ··· p.1057
##### Analytic TEPower Model ··· p.1058
##### PMI_ThermoElectricPower Model ··· p.1059
##### Thermoelectric Power in Metals ··· p.1059
#### Using Thermoelectric Power ··· p.1059
### Heating at Contacts, Metal–Semiconductor and Conductive Insulator–Semiconductor Interfaces ··· p.1061
### References ··· p.1062
## 34. Light-Emitting Diodes ··· p.1064
### Modeling Light-Emitting Diodes ··· p.1064
### Coupling Electronics and Optics in LED Simulations ··· p.1065
#### Single-Grid Versus Dual-Grid LED Simulation ··· p.1065
### Electrical Transport in Light-Emitting Diodes ··· p.1066
#### Spontaneous Emission Rate and Power ··· p.1066
##### Spontaneous Emission Power Spectrum ··· p.1067
#### Current File and Plot Variables for LED Simulations ··· p.1068
#### LED Wavelength ··· p.1071
#### Optical Absorption Heat ··· p.1071
#### Quantum Well Physics ··· p.1072
#### Accelerating Gain Calculations and LED Simulations ··· p.1073
#### Discussion of LED Physics ··· p.1073
### LED Optics: Raytracing ··· p.1074
#### Compact Memory Raytracing ··· p.1075
#### Isotropic Starting Rays From Spontaneous Emission Sources ··· p.1075
#### Anisotropic Starting Rays From Spontaneous Emission Sources ··· p.1076
#### Randomizing Starting Rays ··· p.1077
##### Pseudorandom Starting Rays ··· p.1078
#### Reading Starting Rays From File ··· p.1078
#### Moving Starting Rays on Boundaries ··· p.1079
#### Clustering Active Vertices ··· p.1079
##### Plane Area Cluster ··· p.1080
##### Nodal Clustering ··· p.1081
##### Optical Grid Element Clustering ··· p.1081
##### Using the Clustering Feature ··· p.1081
#### Debugging Raytracing ··· p.1081
#### Print Options in Raytracing ··· p.1082
#### Interfacing LED Starting Rays to LightTools ··· p.1083
##### Example: n99_000000_des_lighttools.txt File ··· p.1085
### LED Radiation Pattern ··· p.1086
#### Two-Dimensional LED Radiation Pattern and Output Files ··· p.1088
#### Three-Dimensional LED Radiation Pattern and Output Files ··· p.1088
##### Staggered 3D Grid LED Radiation Pattern ··· p.1089
#### Spectrum-Dependent LED Radiation Pattern ··· p.1091
#### Tracing Source of Output Rays ··· p.1092
### Interfacing Far-Field Rays to LightTools ··· p.1093
#### Example: farfield_lighttools.txt File ··· p.1094
### Nonactive Region Absorption (Photon Recycling) ··· p.1094
### Device Physics and Tuning Parameters ··· p.1095
#### Example of 3D GaN LED Simulation ··· p.1096
### References ··· p.1101
## 35. Quantum Wells ··· p.1102
### Overview ··· p.1102
### Radiative Recombination and Gain Coefficients ··· p.1103
#### Stimulated and Spontaneous Emission Coefficients ··· p.1103
#### Active Bulk Material Gain ··· p.1105
#### Stimulated Recombination Rate ··· p.1105
#### Spontaneous Recombination Rate ··· p.1106
#### Fitting Stimulated and Spontaneous Emission Spectra ··· p.1106
### Gain-Broadening Models ··· p.1106
#### Lorentzian Broadening ··· p.1106
#### Landsberg Broadening ··· p.1107
#### Hyperbolic-Cosine Broadening ··· p.1107
#### Syntax to Activate Broadening ··· p.1107
#### Electronic Band Structure for Wurtzite Crystals ··· p.1108
##### Optical Transition Matrix Element for Wurtzite Crystals ··· p.1112
### Simple Quantum-Well Subband Model ··· p.1113
#### Syntax for Simple Quantum-Well Model ··· p.1116
### Strain Effects ··· p.1116
#### Syntax for Quantum-Well Strain ··· p.1117
### Localized Quantum-Well Model ··· p.1118
### Nonlocal Quantum-Well Model Using 1D Schrödinger Solver ··· p.1121
### Importing Gain and Spontaneous Emission Data With PMI ··· p.1122
#### Implementing Gain PMI ··· p.1123
### References ··· p.1125
## 36. Kinetic Monte Carlo MIM Transport ··· p.1127
### KMC Simulation Space and Math Settings ··· p.1127
#### KMC Simulation Space ··· p.1128
#### Setting the Minimum Defect Distances ··· p.1129
#### Specifying the Random Seed ··· p.1130
#### Omitting KMC Simulations Near Steady State ··· p.1130
#### Omitting the KMC Simulation Completely ··· p.1131
#### Resetting the Fraction of Defects Filled With Electrons ··· p.1131
#### Sampling Potential at All Crossings ··· p.1131
#### Resetting the Rate More Frequently ··· p.1131
#### Adjusting the Calculated Tunneling Rates ··· p.1132
#### Setting the Integration Points ··· p.1132
#### Specifying the Approximate Bessel Function ··· p.1132
### Specifying Electrodes ··· p.1133
### Specifying Insulators ··· p.1134
### Specifying Defects ··· p.1135
#### Defining Defects ··· p.1135
#### Reading in Defects ··· p.1137
### Creating the Grain Field ··· p.1138
### Tunneling Processes ··· p.1139
#### Specifying Tunneling Processes and Related Options ··· p.1139
#### Direct Tunneling ··· p.1140
#### Poole–Frenkel Emission ··· p.1142
#### Elastic Electrode-to-Trap and Trap-to-Electrode Tunneling ··· p.1142
##### Option for Elastic Tunneling ··· p.1143
#### Inelastic Electrode-to-Trap and Trap-to-Electrode Tunneling ··· p.1143
##### Options for Inelastic Tunneling ··· p.1145
#### Trap-to-Trap Tunneling ··· p.1145
##### Trap-to-Trap Tunneling Model ··· p.1145
##### Inelastic Phonon Trap-to-Trap Tunneling Model ··· p.1146
##### Multiphonon Trap-to-Trap Tunneling Model ··· p.1146
#### Image Charge Barrier Lowering ··· p.1148
#### Energy-Dependent Mass ··· p.1148
#### Including the MIM Charge in the Poisson Equation ··· p.1149
##### Average Electron Occupancy in the MIM Charge ··· p.1150
#### Printing Options ··· p.1150
#### Rate Equation Current Calculation ··· p.1151
#### Conductive Path Current Analysis ··· p.1152
#### Sensitivity Analysis ··· p.1152
#### Time-Dependent Dielectric Breakdown Simulations ··· p.1155
##### Adjustment for Vacancy Sites per Volume ··· p.1156
##### TDDB Time-Step Management ··· p.1157
##### TDDB Break Criteria ··· p.1157
##### TDDB Models ··· p.1159
##### Fluence Dependency ··· p.1160
##### Cluster Size–Dependent Conductance Model ··· p.1161
### Performing the Simulation ··· p.1162
### Printed Output ··· p.1163
#### Setup Information ··· p.1163
#### Occupancy and Energy ··· p.1165
#### Event Statistics ··· p.1166
#### Tunneling Rates ··· p.1167
### Quantities Available for Plotting ··· p.1167
#### Quantities Written to the Current Plot (*.plt) File ··· p.1167
#### Special MIM Current File (Currents and Capacitance) ··· p.1168
#### Quantities Written to TDR Files ··· p.1168
##### Concentration Plots ··· p.1168
##### Particle Plots ··· p.1169
#### Band Diagram With Traps ··· p.1169
### Example: MIM Leakage Current ··· p.1170
#### Sentaurus Device Command File ··· p.1171
#### Sentaurus Device Parameter File ··· p.1173
#### Results ··· p.1173
### Example: TiN/ZrO₂/TiN KMC-TDDB Simulation ··· p.1174
#### Sentaurus Device Command File ··· p.1175
#### Sentaurus Device Parameter File ··· p.1177
#### Results ··· p.1178
### References ··· p.1180
## 37. Kinetic Monte Carlo ReRAM ··· p.1182
### Starting the Simulation and Specifying Particles ··· p.1182
#### Capacity of Defects ··· p.1183
### KMC Events ··· p.1184
#### Location of KMC Events ··· p.1185
#### Particle or Particle Pairs Involved in KMC Events ··· p.1185
#### Parameters of KMC Events ··· p.1186
##### Diffusion Events ··· p.1186
##### Generation and Recombination Events ··· p.1186
##### Filament Growth and Recession Events ··· p.1187
### KMC Simulation Space and Math Settings ··· p.1188
#### KMC Simulation Space ··· p.1188
#### Random Seed ··· p.1189
#### KMC Time Step Control ··· p.1189
#### Current Compliance ··· p.1190
### Specifying the Material ··· p.1191
### Specifying the Field and Temperature ··· p.1192
### Transient Calculation for ReRAM ··· p.1193
### Current in ReRAM Operations ··· p.1193
#### Conduction Current ··· p.1193
#### Trap-Assisted Tunneling Calculation ··· p.1193
##### Particles for Trap-Assisted Tunneling Calculation ··· p.1193
##### Physics for Trap-Assisted Tunneling Calculation ··· p.1194
##### Stopping Criteria of Trap-Assisted Tunneling Calculation ··· p.1195
##### Parameters for Trap-Assisted Tunneling Calculation ··· p.1195
### Simulation Output ··· p.1196
#### Current and Particles ··· p.1196
#### Event and Particle Statistics ··· p.1197
#### Defect and Field Visualization ··· p.1198
### ReRAM Example ··· p.1199
#### Sentaurus Device Command File ··· p.1199
#### Sentaurus Device Parameter File ··· p.1203
# Part III:Numeric Methods and External Interfaces
## 38. Numeric Methods ··· p.1207
### Discretization ··· p.1207
#### Extended Precision ··· p.1209
### Box Method Coefficients in the 3D Case ··· p.1209
#### Basic Definitions ··· p.1209
#### Element Intersection Box Method Algorithm ··· p.1212
#### Truncated Obtuse Elements ··· p.1213
#### Weighted Box Method Coefficients ··· p.1216
##### Weighted Points ··· p.1216
##### Weighted Voronoï Diagram ··· p.1217
#### Saving and Restoring Box Method Coefficients ··· p.1218
#### Statistics About Non-Delaunay Elements ··· p.1219
##### Region Non-Delaunay Elements ··· p.1220
##### Interface Non-Delaunay Elements ··· p.1220
##### Plot Section ··· p.1221
### Arbitrary Box Method ··· p.1222
### AC Simulation ··· p.1228
#### AC Response ··· p.1228
#### AC Current Density Responses ··· p.1230
### Harmonic Balance Analysis ··· p.1231
#### Harmonic Balance Equation ··· p.1231
#### Multitone Harmonic Balance Analysis ··· p.1231
##### Multidimensional Fourier Transformation ··· p.1232
##### Quasi-Periodic Functions ··· p.1233
##### Multidimensional Frequency Domain Problem ··· p.1233
##### One-Tone Harmonic Balance Analysis ··· p.1233
#### Solving the Harmonic Balance Equation ··· p.1234
#### Solving the Harmonic Balance Newton Step Equation ··· p.1234
##### Restarted GMRES Method ··· p.1235
##### Direct Solver Method ··· p.1235
### Transient Simulation ··· p.1236
#### Backward Euler Method ··· p.1236
#### TRBDF Composite Method ··· p.1237
#### Controlling Transient Simulations ··· p.1237
##### Floating Gates ··· p.1238
### Nonlinear Solvers ··· p.1239
#### Fully Coupled Solution ··· p.1240
#### ‘Plugin’ Iterations ··· p.1241
### References ··· p.1242
## 39. Physical Model Interface ··· p.1244
### Introduction to the Physical Model Interface ··· p.1244
#### Using a PMI Model ··· p.1247
#### Available Interfaces ··· p.1247
##### Standard C++ Interface ··· p.1248
##### Simplified C++ Interface ··· p.1251
##### Nonlocal Interface ··· p.1255
##### Shared Object Code ··· p.1267
#### Command File of Sentaurus Device ··· p.1267
#### Parameter File of Sentaurus Device ··· p.1269
#### Parallelization ··· p.1271
##### Thread-Local Storage ··· p.1271
#### Debugging Physical Model Interfaces ··· p.1272
#### Runtime Support for Vertex-Based PMI Models ··· p.1274
##### Support at Model Scope ··· p.1274
##### Support at Compute Scope ··· p.1276
##### Experimental Functions ··· p.1281
#### Runtime Support for Vertex-Based Multistate Configuration–Dependent Models ··· p.1281
#### Runtime Support for Mesh-Based PMI Models ··· p.1282
##### Device Mesh ··· p.1284
##### Device Data ··· p.1290
#### Runtime Support to Write PMI Output to Log File ··· p.1295
### Generation–Recombination ··· p.1295
#### Avalanche Generation ··· p.1296
##### Dependencies ··· p.1296
##### Standard C++ Interface ··· p.1297
##### Simplified C++ Interface ··· p.1298
##### Example: Okuto Avalanche Generation ··· p.1299
#### Generation–Recombination ··· p.1302
##### Dependencies ··· p.1302
##### Standard C++ Interface ··· p.1303
##### Simplified C++ Interface ··· p.1304
##### Example: Auger Recombination ··· p.1305
#### Lifetimes ··· p.1305
##### Dependencies ··· p.1305
##### Standard C++ Interface ··· p.1306
##### Simplified C++ Interface ··· p.1306
##### Example: Doping- and Temperature-Dependent Lifetimes ··· p.1307
#### Nonlocal Generation–Recombination ··· p.1309
##### Dependencies ··· p.1309
##### Standard C++ Interface ··· p.1310
##### Simplified C++ Interface ··· p.1311
##### Example: Point-to-Point Tunneling ··· p.1312
#### Tunneling Parameters ··· p.1312
##### Dependencies ··· p.1312
##### Simplified C++ Interface ··· p.1313
##### Example: Constant Tunneling Parameters ··· p.1313
### Mobility ··· p.1314
#### Doping-Dependent Mobility ··· p.1315
##### Dependencies ··· p.1315
##### Standard C++ Interface ··· p.1316
##### Simplified C++ Interface ··· p.1317
##### Example: Masetti Doping-Dependent Mobility ··· p.1317
#### Fitting Parameter for Ballistic Mobility ··· p.1320
##### Dependencies ··· p.1320
##### Standard C++ Interface ··· p.1321
##### Simplified C++ Interface ··· p.1321
##### Example: Ballistic Mobility ··· p.1321
#### High-Field Saturation ··· p.1323
##### Dependencies ··· p.1323
##### Standard C++ Interface ··· p.1324
##### Simplified C++ Interface ··· p.1326
##### Example: Canali High-Field Saturation ··· p.1327
#### High-Field Saturation With Two Driving Forces ··· p.1331
##### Command File ··· p.1331
##### Dependencies ··· p.1331
##### Standard C++ Interface ··· p.1333
##### Simplified C++ Interface ··· p.1334
#### Mobility Degradation at Interfaces ··· p.1335
##### Dependencies ··· p.1335
##### Standard C++ Interface ··· p.1337
##### Simplified C++ Interface ··· p.1338
##### Example: Lombardi Mobility Degradation ··· p.1339
### Semiconductor Band Structure ··· p.1343
#### Apparent Band-Edge Shift ··· p.1343
##### Dependencies ··· p.1344
##### Standard C++ Interface ··· p.1345
##### Simplified C++ Interface ··· p.1346
#### Band Gap ··· p.1346
##### Dependencies ··· p.1347
##### Standard C++ Interface ··· p.1347
##### Simplified C++ Interface ··· p.1347
##### Example: Default Temperature Dependence ··· p.1348
#### Bandgap Narrowing ··· p.1349
##### Dependencies ··· p.1349
##### Standard C++ Interface ··· p.1350
##### Simplified C++ Interface ··· p.1350
##### Example: Bennett–Wilson Bandgap Narrowing ··· p.1351
#### Effective Mass ··· p.1352
##### Dependencies ··· p.1352
##### Standard C++ Interface ··· p.1352
##### Simplified C++ Interface ··· p.1353
##### Example: Linear Effective Mass ··· p.1354
#### Electron Affinity ··· p.1355
##### Dependencies ··· p.1356
##### Standard C++ Interface ··· p.1356
##### Simplified C++ Interface ··· p.1357
##### Example: Default Temperature Dependence ··· p.1357
### Phase and State Transitions ··· p.1358
#### Multistate Configuration–Dependent Apparent Band-Edge Shift ··· p.1358
##### Dependencies ··· p.1359
##### Additional Functionality ··· p.1359
##### Standard C++ Interface ··· p.1360
##### Simplified C++ Interface ··· p.1361
#### Multistate Configuration–Dependent Bulk Mobility ··· p.1362
##### Command File ··· p.1362
##### Dependencies ··· p.1362
##### Standard C++ Interface ··· p.1363
##### Simplified C++ Interface ··· p.1364
#### Multistate Configuration–Dependent Heat Capacity ··· p.1364
##### Command File ··· p.1365
##### Dependencies ··· p.1365
##### Standard C++ Interface ··· p.1366
##### Simplified C++ Interface ··· p.1366
#### Multistate Configuration–Dependent Thermal Conductivity ··· p.1367
##### Command File ··· p.1367
##### Dependencies ··· p.1368
##### Standard C++ Interface ··· p.1368
##### Simplified C++ Interface ··· p.1370
### Thermal Properties and Heat ··· p.1371
#### Distributed Thermal Resistance ··· p.1371
##### Dependencies ··· p.1371
##### Simplified C++ Interface ··· p.1372
##### Example: Electron Density Dependence ··· p.1373
#### Heat Capacity ··· p.1374
##### Dependencies ··· p.1374
##### Standard C++ Interface ··· p.1375
##### Simplified C++ Interface ··· p.1375
##### Example: Constant Heat Capacity ··· p.1376
#### Heat Generation Rate ··· p.1377
##### Dependencies ··· p.1377
##### Standard C++ Interface ··· p.1378
##### Simplified C++ Interface ··· p.1379
##### Example: Dependency on Electric Field and Gradient of Temperature ··· p.1380
#### Metal Thermoelectric Power ··· p.1381
##### Dependencies ··· p.1381
##### Standard C++ Interface ··· p.1381
##### Simplified C++ Interface ··· p.1382
##### Example: Linear Field Dependency of Metal TEP ··· p.1383
#### Thermal Conductivity ··· p.1385
##### Dependencies ··· p.1385
##### Standard C++ Interface ··· p.1386
##### Simplified C++ Interface ··· p.1386
##### Example: Temperature-Dependent Thermal Conductivity ··· p.1387
##### Example: Thin-Layer Thermal Conductivity ··· p.1388
#### Thermoelectric Power ··· p.1390
##### Dependencies ··· p.1391
##### Standard C++ Interface ··· p.1391
##### Simplified C++ Interface ··· p.1392
##### Example: Analytic TEP ··· p.1392
### Optics ··· p.1395
#### Complex Refractive Index Model Interface ··· p.1395
##### C++ Application Programming Interface ··· p.1396
##### Shared Object Code ··· p.1401
##### Command File of Sentaurus Device ··· p.1401
#### Optical Quantum Yield ··· p.1402
##### Dependencies ··· p.1402
##### Standard C++ Interface ··· p.1403
##### Simplified C++ Interface ··· p.1404
#### Special Contact PMI for Raytracing ··· p.1405
##### Dependencies ··· p.1406
##### Standard C++ Interface ··· p.1408
##### Example: Assessing and Modifying a Ray ··· p.1409
### Mechanical Stress ··· p.1412
#### Mobility Stress Factor ··· p.1412
##### Dependencies ··· p.1412
##### Standard C++ Interface ··· p.1413
##### Simplified C++ Interface ··· p.1413
##### Example: Effective Stress ··· p.1414
#### Piezoelectric Polarization ··· p.1419
##### Dependencies ··· p.1419
##### Standard C++ Interface ··· p.1420
##### Simplified C++ Interface ··· p.1420
##### Example: Gaussian Polarization ··· p.1421
#### Piezoresistive Coefficients ··· p.1421
##### Dependencies ··· p.1422
##### Standard C++ Interface ··· p.1422
##### Simplified C++ Interface ··· p.1423
#### Stress ··· p.1423
##### Dependencies ··· p.1423
##### Standard C++ Interface ··· p.1424
##### Simplified C++ Interface ··· p.1425
##### Example: Constant Stress ··· p.1425
### Traps and Fixed Charges ··· p.1427
#### Trap Capture and Emission Rates ··· p.1427
##### Traps ··· p.1427
##### Multistate Configurations ··· p.1427
##### Dependencies ··· p.1428
##### Standard C++ Interface ··· p.1429
##### Simplified C++ Interface ··· p.1430
##### Example: Arrhenius Law ··· p.1431
#### Trap Energy Shift ··· p.1431
##### Command File ··· p.1431
##### Dependencies ··· p.1431
##### Standard C++ Interface ··· p.1432
##### Simplified C++ Interface ··· p.1432
### Degradation ··· p.1433
#### Diffusivity ··· p.1433
##### Dependencies ··· p.1434
##### Simplified C++ Interface ··· p.1434
##### Example: Field-Dependent Hydrogen Diffusivity ··· p.1435
#### eNMP Transition Rates ··· p.1437
##### Distinction Between Electron and Hole Transitions ··· p.1438
##### Transition Rates for All Sample Defects ··· p.1438
##### Parameter Randomization ··· p.1439
##### Dependencies ··· p.1440
##### Standard C++ Interface ··· p.1442
##### Simplified C++ Interface ··· p.1443
##### Example: eNMP Model Transition Rates ··· p.1443
### Ferroelectrics and Ferromagnetics ··· p.1448
#### Ferroelectrics ··· p.1448
#### Ferroelectrics Hysteresis ··· p.1450
##### Dependencies ··· p.1450
##### Standard C++ Interface ··· p.1451
#### Ferromagnetism and Spin Transport ··· p.1452
##### User-Defined Interlayer Exchange Coupling ··· p.1453
##### User-Defined Bulk or Interface Contributions to the Effective Magnetic Field ··· p.1456
##### User-Defined Magnetostatic Potential Calculation ··· p.1465
### Electrical Resistivity ··· p.1466
#### Metal Resistivity ··· p.1466
##### Dependencies ··· p.1466
##### Standard C++ Interface ··· p.1467
##### Simplified C++ Interface ··· p.1467
##### Example: Linear Metal Resistivity ··· p.1468
#### Schottky Resistance ··· p.1469
##### Dependencies ··· p.1470
##### Standard C++ Interface ··· p.1471
##### Simplified C++ Interface ··· p.1472
##### Example: Built-in Schottky Resistance ··· p.1472
### Simulation Controls ··· p.1474
#### Current Plot File ··· p.1474
##### Structure of Current Plot File ··· p.1475
##### Standard C++ Interface ··· p.1475
##### Simplified C++ Interface ··· p.1476
##### Example: Average Electrostatic Potential ··· p.1477
#### Postprocessing for Transient Simulations ··· p.1479
##### Standard C++ Interface ··· p.1479
##### Simplified C++ Interface ··· p.1479
##### Example: Postprocess User-Field ··· p.1480
#### Preprocessing for Newton Iterations and Newton Step Control ··· p.1481
##### Standard C++ Interface ··· p.1482
##### Simplified C++ Interface ··· p.1483
##### Flow of Computation ··· p.1484
### Various ··· p.1485
#### Dielectric Permittivity ··· p.1485
##### Dependencies ··· p.1485
##### Standard C++ Interface ··· p.1486
##### Simplified C++ Interface ··· p.1486
##### Example: Temperature-Dependent Dielectric Permittivity ··· p.1487
#### Energy Relaxation Times ··· p.1488
##### Dependencies ··· p.1488
##### Standard C++ Interface ··· p.1489
##### Simplified C++ Interface ··· p.1489
##### Example: Constant Energy Relaxation Times ··· p.1490
#### Gamma Factor for Density Gradient Model ··· p.1492
##### Dependencies ··· p.1492
##### Standard C++ Interface ··· p.1493
##### Simplified C++ Interface ··· p.1494
##### Example: Solution-Dependent Gamma Factor ··· p.1495
#### Heavy Ion Spatial Distribution ··· p.1497
##### Dependencies ··· p.1497
##### Standard C++ Interface ··· p.1497
##### Simplified C++ Interface ··· p.1498
##### Example: Gaussian Spatial Distribution Function ··· p.1499
#### Hot-Carrier Injection ··· p.1500
##### Dependencies ··· p.1500
##### Standard C++ Interface ··· p.1500
##### Simplified C++ Interface ··· p.1501
##### Example: Lucky Hot-Carrier Injection ··· p.1502
#### Incomplete Ionization ··· p.1507
##### Dependencies ··· p.1508
##### Standard C++ Interface ··· p.1508
##### Simplified C++ Interface ··· p.1509
##### Example: Matsuura Incomplete Ionization ··· p.1510
#### Mean Free Path for Classical Lucky Electron Injection ··· p.1514
##### Dependencies ··· p.1515
##### Simplified C++ Interface ··· p.1515
##### Example: Mean Free Path in Semiconductor ··· p.1516
#### Space Factor ··· p.1517
##### Dependencies ··· p.1518
##### Standard C++ Interface ··· p.1518
##### Simplified C++ Interface ··· p.1518
##### Example: PMI User Field as Space Factor ··· p.1519
### References ··· p.1520
## 40. Tcl Interfaces ··· p.1521
### Mesh-Based Runtime Support ··· p.1521
#### Device Mesh ··· p.1522
##### Vertex ··· p.1523
##### Edge ··· p.1524
##### Element ··· p.1525
##### Region ··· p.1525
##### Region Interface ··· p.1527
#### Device Data ··· p.1527
##### One-Dimensional Arrays ··· p.1528
##### Two-Dimensional Arrays ··· p.1529
### Current Plot File ··· p.1529
#### Tcl Functions ··· p.1529
##### tcl_cp_constructor ··· p.1530
##### tcl_cp_destructor ··· p.1530
##### tcl_cp_Compute_Dataset_Names ··· p.1530
##### tcl_cp_Compute_Function_Names ··· p.1531
##### tcl_cp_Compute_Plot_Values ··· p.1531
#### Example: Average Electron Conductivity ··· p.1531
## 41. Python Interface ··· p.1534
### Overview of Python Interface ··· p.1534
### Performing Device Simulations ··· p.1535
### Changing Physical Constants ··· p.1536
### Using Time Step Callback in Solve ··· p.1538
### Using Plugin Step Callback in Solve ··· p.1539
### Accessing Current Plot Data ··· p.1541
### Accessing Device Plot Data ··· p.1542
### Creating Custom Datasets ··· p.1543
#### Device Class ··· p.1543
#### DeviceMesh Class ··· p.1544
#### DeviceRegion, DeviceRegionInterface, and DeviceContact Classes ··· p.1544
#### DeviceData Class ··· p.1545
#### NumPy Usage ··· p.1545
### Extracting Parameters ··· p.1546
### Limitations ··· p.1548
# Part IV: Appendices
## A.Mathematical Symbols ··· p.1550
## B.Syntax ··· p.1555
## C.File-Naming Conventions ··· p.1557
### File Extensions ··· p.1557
## D.Command-Line Options ··· p.1559
### Starting Sentaurus Device ··· p.1559
### Command-Line Options ··· p.1559
## E.Runtime Statistics ··· p.1562
### Generating Statistics ··· p.1562
## F.Data Names and Plot Names ··· p.1563
### Scalar Data ··· p.1564
### Vector Data ··· p.1598
### Special Vector Data ··· p.1601
### Tensor Data ··· p.1602
### Particle Data ··· p.1602
## G.Command File Overview ··· p.1603
### Organization of Command File Overview ··· p.1603
### Top Level of Command File ··· p.1605
### CurrentPlot ··· p.1606
### Device ··· p.1608
### Electrode ··· p.1610
### File ··· p.1612
### GainPlot ··· p.1616
### HydrogenBoundary ··· p.1617
### IFM ··· p.1617
### Math ··· p.1618
### NoisePlot ··· p.1664
### NonLocalPlot ··· p.1665
### OpticalDevice ··· p.1665
### Physics ··· p.1666
#### Generation and Recombination ··· p.1680
#### LED ··· p.1707
#### Mobility ··· p.1714
#### Radiation Models ··· p.1720
#### Various ··· p.1721
### Plot ··· p.1766
### RayTraceBC ··· p.1767
### Solve ··· p.1768
### System ··· p.1789
### TensorPlot ··· p.1791
### Thermode ··· p.1791
### Various ··· p.1792
## H.Licensed Features ··· p.1794
### Licensed Features in Sentaurus Device ··· p.1794
