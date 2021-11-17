# SCRIPT TO RUN PB DOMAIN WITH TERRAIN-FOLLOWING GRID
# DETAILS:
# Arugments are 1) runname 2) year

# Import the ParFlow TCL package
lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

#-----------------------------------------------------------------------------
# Make a directory for the simulation run, files will be copied to this
# directory for running.
#-----------------------------------------------------------------------------
file mkdir "Outputs"
cd "./Outputs"

pfset     FileVersion    4

#-----------------------------------------------------------------------------
# Set Processor topology 
#-----------------------------------------------------------------------------
pfset Process.Topology.P 1
pfset Process.Topology.Q 1
pfset Process.Topology.R 1

#-----------------------------------------------------------------------------
# Computational Grid
#-----------------------------------------------------------------------------
pfset ComputationalGrid.Lower.X           0.0
pfset ComputationalGrid.Lower.Y           0.0
pfset ComputationalGrid.Lower.Z           0.0 

pfset ComputationalGrid.DX                2.5
pfset ComputationalGrid.DY                2.5
pfset ComputationalGrid.DZ                2.5

pfset ComputationalGrid.NX                99 
pfset ComputationalGrid.NY                19 
pfset ComputationalGrid.NZ                15  

#-----------------------------------------------------------------------------
# Names of the GeomInputs
#-----------------------------------------------------------------------------
pfset GeomInput.Names                     "block1_input solidinput"

#-----------------------------------------------------------------------------
# Domain Geometry Input
#-----------------------------------------------------------------------------
#pfset GeomInput.domain_input.InputType            Box
#pfset GeomInput.domain_input.GeomName             domain

#-----------------------------------------------------------------------------
# Domain Geometry 
#-----------------------------------------------------------------------------
pfset Geom.domain.Lower.X                        0.0
pfset Geom.domain.Lower.Y                        0.0
pfset Geom.domain.Lower.Z                        0.0
 
pfset Geom.domain.Upper.X                        41000.0
pfset Geom.domain.Upper.Y                        41000.0
pfset Geom.domain.Upper.Z                          100.0
#pfset Geom.domain.Patches             "x-lower x-upper y-lower y-upper z-lower z-upper"

#----------------------------------------------------------------------------
# Additional block to input solid file
#----------------------------------------------------------------------------
pfset GeomInput.solidinput.InputType  SolidFile
pfset GeomInput.solidinput.GeomNames  sol
pfset GeomInput.solidinput.FileName   apples.pfsol

pfset Geom.sol.Patches "left right front back bottom top"

#-----------------------------------------------------------------------------
# Domain
#-----------------------------------------------------------------------------
pfset Domain.GeomName sol

#----------------------------------------------------------------------------
# Block1 Geometry Input
#----------------------------------------------------------------------------
pfset GeomInput.block1_input.InputType        Box
pfset GeomInput.block1_input.GeomName   	block1

#----------------------------------------------------------------------------
# Block1 Geometry
#----------------------------------------------------------------------------
pfset Geom.block1.Lower.X                        -99999999.0
pfset Geom.block1.Lower.Y                       -99999999.0
pfset Geom.block1.Lower.Z                        -99999999.0

pfset Geom.block1.Upper.X                      99999999.0
pfset Geom.block1.Upper.Y                        99999999.0
pfset Geom.block1.Upper.Z                        99999999.0

#-----------------------------------------------------------------------------
# Perm
#-----------------------------------------------------------------------------
pfset Geom.Perm.Names "sol"

pfset Geom.sol.Perm.Type     Constant
pfset Geom.sol.Perm.Value    4.0

pfset Perm.TensorType               TensorByGeom

pfset Geom.Perm.TensorByGeom.Names  "block1"

pfset Geom.block1.Perm.TensorValX  1.0
pfset Geom.block1.Perm.TensorValY  1.0
pfset Geom.block1.Perm.TensorValZ  1.0


#-----------------------------------------------------------------------------
# Specific Storage
#-----------------------------------------------------------------------------
pfset SpecificStorage.Type                Constant
pfset SpecificStorage.GeomNames           "domain"
pfset Geom.sol.SpecificStorage.Value   1.0e-5

#-----------------------------------------------------------------------------
# Phases
#-----------------------------------------------------------------------------
pfset Phase.Names                         "water"
pfset Phase.water.Density.Type            Constant
pfset Phase.water.Density.Value           1.0
pfset Phase.water.Viscosity.Type          Constant
pfset Phase.water.Viscosity.Value         1.0

#-----------------------------------------------------------------------------
# Contaminants
#-----------------------------------------------------------------------------
pfset Contaminants.Names                  ""

#-----------------------------------------------------------------------------
# Gravity
#-----------------------------------------------------------------------------
pfset Gravity                             1.0

#-----------------------------------------------------------------------------
# Setup timing info
#-----------------------------------------------------------------------------

pfset TimingInfo.BaseUnit		1.0
pfset TimingInfo.StartCount		0
pfset TimingInfo.StartTime		0.0
pfset TimingInfo.StopTime               365.0
pfset TimingInfo.DumpInterval	       -10
pfset TimeStep.Type                     Constant
pfset TimeStep.Value                    0.1

#-----------------------------------------------------------------------------
# Porosity
#-----------------------------------------------------------------------------

pfset Geom.Porosity.GeomNames          sol

pfset Geom.sol.Porosity.Type    Constant
pfset Geom.sol.Porosity.Value   0.4

#-----------------------------------------------------------------------------
# Relative Permeability
#-----------------------------------------------------------------------------

pfset Phase.RelPerm.Type               VanGenuchten
pfset Phase.RelPerm.GeomNames          sol
pfset Geom.sol.RelPerm.Alpha        1.5
pfset Geom.sol.RelPerm.N            2.0    

#---------------------------------------------------------
# Saturation
#---------------------------------------------------------

pfset Phase.Saturation.Type            VanGenuchten
pfset Phase.Saturation.GeomNames       sol
pfset Geom.sol.Saturation.Alpha     0.5
pfset Geom.sol.Saturation.N         2.0
pfset Geom.sol.Saturation.SRes      0.2
pfset Geom.sol.Saturation.SSat      0.99

#----------------------------------------------------------------------------
# Mobility
#----------------------------------------------------------------------------
pfset Phase.water.Mobility.Type        Constant
pfset Phase.water.Mobility.Value       1.0

#-----------------------------------------------------------------------------
# Wells
#-----------------------------------------------------------------------------
pfset Wells.Names                         ""

#-----------------------------------------------------------------------------
# Time Cycles
#-----------------------------------------------------------------------------
pfset Cycle.Names                         "constant"
pfset Cycle.constant.Names                "alltime"
pfset Cycle.constant.alltime.Length        1
pfset Cycle.constant.Repeat               -1

#-----------------------------------------------------------------------------
# Boundary Conditions: Pressure
#-----------------------------------------------------------------------------
pfset BCPressure.PatchNames "left right front back bottom top"


pfset Patch.left.BCPressure.Type			FluxConst
pfset Patch.left.BCPressure.Cycle			"constant"
pfset Patch.left.BCPressure.alltime.Value		0.0

pfset Patch.right.BCPressure.Type			FluxConst
pfset Patch.right.BCPressure.Cycle			"constant"
pfset Patch.right.BCPressure.RefGeom			sol
pfset Patch.right.BCPressure.RefPatch			bottom
pfset Patch.right.BCPressure.alltime.Value		0.0

pfset Patch.front.BCPressure.Type			FluxConst
pfset Patch.front.BCPressure.Cycle			"constant"
pfset Patch.front.BCPressure.alltime.Value		0.0

pfset Patch.back.BCPressure.Type			FluxConst
pfset Patch.back.BCPressure.Cycle			"constant"
pfset Patch.back.BCPressure.alltime.Value		0.0

pfset Patch.bottom.BCPressure.Type			FluxConst
pfset Patch.bottom.BCPressure.Cycle			"constant"
pfset Patch.bottom.BCPressure.alltime.Value		0.0

pfset Patch.top.BCPressure.Type			        FluxConst
pfset Patch.top.BCPressure.Cycle			"constant"
pfset Patch.top.BCPressure.alltime.Value		-0.2


#-----------------------------------------------------------------------------
# Topo slopes in x-direction
#-----------------------------------------------------------------------------
pfset TopoSlopesX.Type                                "PFBFile"
pfset TopoSlopesX.GeomNames                           "sol"
pfset TopoSlopesX.FileName                            "pb.slope_x.pfb"

#-----------------------------------------------------------------------------
# Topo slopes in y-direction
#-----------------------------------------------------------------------------
pfset TopoSlopesY.Type                                "PFBFile"
pfset TopoSlopesY.GeomNames                           "sol"
pfset TopoSlopesY.FileName                            "pb.slope_y.pfb"

#-----------------------------------------------------------------------------
# Mannings coefficient
#-----------------------------------------------------------------------------
pfset Mannings.Type                                   "Constant"
pfset Mannings.GeomNames                              "domain"
pfset Mannings.Geom.domain.Value                      5.52e-6


#-----------------------------------------------------------------------------
# Phase sources:
#-----------------------------------------------------------------------------
pfset PhaseSources.water.Type                         "Constant"
pfset PhaseSources.water.GeomNames                    "sol"
pfset PhaseSources.water.Geom.domain.Value            0.0

#----------------------------------------------------------------
# CLM Settings:
# ------------------------------------------------------------
pfset Solver.LSM                                      CLM
pfset Solver.CLM.CLMFileDir                           "clm_output/"
pfset Solver.CLM.Print1dOut                           False
pfset Solver.BinaryOutDir                             False
pfset Solver.CLM.CLMDumpInterval                      1

pfset Solver.CLM.MetForcing                           3D
pfset Solver.CLM.MetFileName                          "NLDAS"
pfset Solver.CLM.MetFilePath                          "."
pfset Solver.CLM.MetFileNT                            24
pfset Solver.CLM.IstepStart                           1

pfset Solver.CLM.EvapBeta                             Linear
pfset Solver.CLM.VegWaterStress                       Saturation
pfset Solver.CLM.ResSat                               0.1
pfset Solver.CLM.WiltingPoint                         0.12
pfset Solver.CLM.FieldCapacity                        0.98
pfset Solver.CLM.IrrigationType                       none

#---------------------------------------------------------
# Initial conditions: water pressure
#---------------------------------------------------------
pfset ICPressure.Type                                 PFBFile
pfset ICPressure.GeomNames                            sol
pfset Geom.domain.ICPressure.RefPatch                   top
pfset Geom.domain.ICPressure.FileName                   press.init.pfb

#----------------------------------------------------------------
# Outputs
# ------------------------------------------------------------
#Writing output (all pfb):
pfset Solver.PrintSubsurfData                         False
pfset Solver.PrintPressure                            True
pfset Solver.PrintSaturation                          True
pfset Solver.PrintMask                                True

pfset Solver.WriteCLMBinary                           False
pfset Solver.PrintCLM                                 True
pfset Solver.WriteSiloSpecificStorage                 False
pfset Solver.WriteSiloMannings                        False
pfset Solver.WriteSiloMask                            False
pfset Solver.WriteSiloSlopes                          False
pfset Solver.WriteSiloSubsurfData                     False
pfset Solver.WriteSiloPressure                        False
pfset Solver.WriteSiloSaturation                      False
pfset Solver.WriteSiloEvapTrans                       False
pfset Solver.WriteSiloEvapTransSum                    False
pfset Solver.WriteSiloOverlandSum                     False
pfset Solver.WriteSiloCLM                             False


#-----------------------------------------------------------------------------
# Exact solution specification for error calculations
#-----------------------------------------------------------------------------
pfset KnownSolution                                   NoKnownSolution

#-----------------------------------------------------------------------------
# Set solver parameters
#-----------------------------------------------------------------------------
# ParFlow Solution
pfset Solver                                          Richards
pfset Solver.TerrainFollowingGrid                     True
pfset Solver.Nonlinear.VariableDz                     False

pfset Solver.MaxIter                                  25000
pfset Solver.Drop                                     1E-20
pfset Solver.AbsTol                                   1E-8
pfset Solver.MaxConvergenceFailures                   8
pfset Solver.Nonlinear.MaxIter                        80
pfset Solver.Nonlinear.ResidualTol                    1e-6

## new solver settings for Terrain Following Grid
pfset Solver.Nonlinear.EtaChoice                         EtaConstant
pfset Solver.Nonlinear.EtaValue                          0.001
pfset Solver.Nonlinear.UseJacobian                       True 
pfset Solver.Nonlinear.DerivativeEpsilon                 1e-16
pfset Solver.Nonlinear.StepTol				 1e-30
pfset Solver.Nonlinear.Globalization                     LineSearch
pfset Solver.Linear.KrylovDimension                      70
pfset Solver.Linear.MaxRestarts                           2

pfset Solver.Linear.Preconditioner                       PFMGOctree
pfset Solver.Linear.Preconditioner.PCMatrixType          FullJacobian


#-----------------------------------------------------------------------------
# Copy files and distribute.
#-----------------------------------------------------------------------------

# ParFlow Inputs
set path "./"
foreach file "pb.slope_x pb.slope_y press.init" {
    file copy -force [format "%s/%s.pfb" $path $file] .
}

#-----------------------------------------------------------------------------
# Distribute inputs
#-----------------------------------------------------------------------------
pfdist -nz 1 pb.slope_x.pfb
pfdist -nz 1 pb.slope_y.pfb

#pfdist IndicatorFile_Gleeson.50z.pfb
pfdist press.init.pfb

#CLM Inputs
set path "./clm_input"
foreach file "drv_clmin drv_vegp drv_vegm.alluv" {
    file copy -force [format "%s/%s.dat" $path $file] .
}

set path "./NLDAS"
foreach file "NLDAS.DSWR.000001_to_000024 NLDAS.DLWR.000001_to_000024 NLDAS.APCP.000001_to_000024 NLDAS.Temp.000001_to_000024 NLDAS.UGRD.000001_to_000024 NLDAS.VGRD.000001_to_000024 NLDAS.Press.000001_to_000024 NLDAS.SPFH.000001_to_000024" {
    file copy -force [format "%s/%s.pfb" $path $file] .
    pfdist -nz 24 [format "%s.pfb" $file]
}

file delete correct_output
file link -symbolic correct_output "../correct_output"

#-----------------------------------------------------------------------------
# Run Simulation 
#-----------------------------------------------------------------------------
set runname "LW"
pfrun    $runname

puts "ParFlow run Complete"

#-----------------------------------------------------------------------------
# Undistribute outputs
#-----------------------------------------------------------------------------
pfundist $runname

set StartTime [expr int([pfget TimingInfo.StartTime])]
set StopTime [expr int([pfget TimingInfo.StopTime])]

set ClmVariables [list "eflx_lh_tot" "qflx_evap_soi" "swe_out" "eflx_lwrad_out" "qflx_evap_tot" "t_grnd" "eflx_sh_tot" "qflx_evap_veg" "t_soil" "eflx_soil_grnd" "qflx_infl" "qflx_evap_grnd" "qflx_tran_veg" ]
for {set i $StartTime} { $i <= $StopTime } {incr i} { 
    set step [format "%05d" $i]
    foreach variable $ClmVariables {
        pfundist $runname.out.$variable.$step.pfb
    }
}

