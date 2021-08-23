#  This runs the basic default_richards test case.
#  This run, as written in this input file, should take
#  3 nonlinear iterations.

#
# Import the ParFlow TCL package
#
lappend auto_path $env(PARFLOW_DIR)/bin 
package require parflow
namespace import Parflow::*

pfset FileVersion 4

pfset Process.Topology.P 1
pfset Process.Topology.Q 1
pfset Process.Topology.R 1

#---------------------------------------------------------
# Computational Grid
#---------------------------------------------------------
pfset ComputationalGrid.Lower.X                  0.0
pfset ComputationalGrid.Lower.Y                  0.0
pfset ComputationalGrid.Lower.Z                  0.0

pfset ComputationalGrid.DX	                 1.0
pfset ComputationalGrid.DY                       1.0
pfset ComputationalGrid.DZ	                 1.0

pfset ComputationalGrid.NX                       100
pfset ComputationalGrid.NY                       2
pfset ComputationalGrid.NZ                       20

#---------------------------------------------------------
# The Names of the GeomInputs
#---------------------------------------------------------
pfset GeomInput.Names "domain_input background_input background1_input background2_input background3_input background4_input background5_input background6_input block1_input block2_input"


#---------------------------------------------------------
# Domain Geometry Input
#---------------------------------------------------------
pfset GeomInput.domain_input.InputType            Box
pfset GeomInput.domain_input.GeomName             domain

#---------------------------------------------------------
# Domain Geometry
#---------------------------------------------------------
pfset Geom.domain.Lower.X                        0
pfset Geom.domain.Lower.Y                        0
pfset Geom.domain.Lower.Z                        0

pfset Geom.domain.Upper.X                        100
pfset Geom.domain.Upper.Y                        2
pfset Geom.domain.Upper.Z                        20

pfset Geom.domain.Patches "left right front back bottom top"

#---------------------------------------------------------
# Background Geometry Input
#---------------------------------------------------------
pfset GeomInput.background_input.InputType         Box
pfset GeomInput.background_input.GeomName          background

#---------------------------------------------------------
# Background Geometry
#---------------------------------------------------------
pfset Geom.background.Lower.X -99999999.0
pfset Geom.background.Lower.Y -99999999.0
pfset Geom.background.Lower.Z -99999999.0

pfset Geom.background.Upper.X  99999999.0
pfset Geom.background.Upper.Y  99999999.0
pfset Geom.background.Upper.Z  99999999.0

#---------------------------------------------------------
# Background1 bottom Geometry Input
#---------------------------------------------------------

pfset GeomInput.background1_input.InputType         Box
pfset GeomInput.background1_input.GeomName          background1

#---------------------------------------------------------
# Background1 bottom Geometry
#---------------------------------------------------------
pfset Geom.background1.Lower.X -99999999.0
pfset Geom.background1.Lower.Y -99999999.0
pfset Geom.background1.Lower.Z -99999999.0

pfset Geom.background1.Upper.X  99999999.0
pfset Geom.background1.Upper.Y  99999999.0
pfset Geom.background1.Upper.Z  -10.0.0

#---------------------------------------------------------
# Background top Geometry Input
#---------------------------------------------------------
pfset GeomInput.background2_input.InputType         Box
pfset GeomInput.background2_input.GeomName          background2

#---------------------------------------------------------
# Background2 top  Geometry
#---------------------------------------------------------
pfset Geom.background2.Lower.X  -99999999.0
pfset Geom.background2.Lower.Y -99999999.0
pfset Geom.background2.Lower.Z 10.0

pfset Geom.background2.Upper.X  99999999.0
pfset Geom.background2.Upper.Y  99999999.0
pfset Geom.background2.Upper.Z  99999999.0

#---------------------------------------------------------
# Background right Geometry Input
#---------------------------------------------------------
pfset GeomInput.background3_input.InputType         Box
pfset GeomInput.background3_input.GeomName          background3

#---------------------------------------------------------
# Background3 right Geometry
#---------------------------------------------------------
pfset Geom.background3.Lower.X  -99999999.0
pfset Geom.background3.Lower.Y 2.0
pfset Geom.background3.Lower.Z -10.0

pfset Geom.background3.Upper.X  99999999.0
pfset Geom.background3.Upper.Y  99999999.0
pfset Geom.background3.Upper.Z  10.0

#---------------------------------------------------------
# Background4 left Geometry Input
#---------------------------------------------------------
pfset GeomInput.background4_input.InputType         Box
pfset GeomInput.background4_input.GeomName          background4

#---------------------------------------------------------
# Background4 left Geometry
#---------------------------------------------------------
pfset Geom.background4.Lower.X  -99999999.0
pfset Geom.background4.Lower.Y -99999999.0
pfset Geom.background4.Lower.Z -10

pfset Geom.background4.Upper.X  99999999.0
pfset Geom.background4.Upper.Y  0.0
pfset Geom.background4.Upper.Z  10.

#---------------------------------------------------------
# Background5 front Geometry Input
#---------------------------------------------------------
pfset GeomInput.background5_input.InputType         Box
pfset GeomInput.background5_input.GeomName          background5

#---------------------------------------------------------
# Background5 front Geometry
#---------------------------------------------------------
pfset Geom.background5.Lower.X  -99999999.0
pfset Geom.background5.Lower.Y 0.00
pfset Geom.background5.Lower.Z -10.0

pfset Geom.background5.Upper.X  0.0
pfset Geom.background5.Upper.Y  2.0
pfset Geom.background5.Upper.Z  10.0

#---------------------------------------------------------
# Background6 back Geometry Input
#---------------------------------------------------------
pfset GeomInput.background6_input.InputType         Box
pfset GeomInput.background6_input.GeomName          background6

#---------------------------------------------------------
# Background6 back Geometry
#---------------------------------------------------------
pfset Geom.background6.Lower.X  100.0
pfset Geom.background6.Lower.Y 0.0
pfset Geom.background6.Lower.Z -10.0

pfset Geom.background6.Upper.X  99999999.0
pfset Geom.background6.Upper.Y  2.0
pfset Geom.background6.Upper.Z  10.0


#----------------------------------------------------------------------------
# Block1 Geometry Input
#----------------------------------------------------------------------------
pfset GeomInput.block1_input.InputType        Box
pfset GeomInput.block1_input.GeomName   	block1

#----------------------------------------------------------------------------
# Block1 Geometry
#----------------------------------------------------------------------------
pfset Geom.block1.Lower.X                        00.0
pfset Geom.block1.Lower.Y                        0.0
pfset Geom.block1.Lower.Z                        -10

pfset Geom.block1.Upper.X                        200
pfset Geom.block1.Upper.Y                        2
pfset Geom.block1.Upper.Z                        0

#----------------------------------------------------------------------------
# Block2 Geometry Input
#----------------------------------------------------------------------------
pfset GeomInput.block2_input.InputType        Box
pfset GeomInput.block2_input.GeomName   	block2

#----------------------------------------------------------------------------
# Block2 Geometry
#----------------------------------------------------------------------------
pfset Geom.block2.Lower.X                        00.0
pfset Geom.block2.Lower.Y                        0.0
pfset Geom.block2.Lower.Z                        0

pfset Geom.block2.Upper.X                        200
pfset Geom.block2.Upper.Y                        2
pfset Geom.block2.Upper.Z                        10.0


#-----------------------------------------------------------------------------
# Perm
#-----------------------------------------------------------------------------
pfset Geom.Perm.Names "background1 background2 background3 background4 background5 background6 block1 block2"

pfset Geom.background1.Perm.Type     Constant
pfset Geom.background1.Perm.Value    5.0

pfset Geom.background2.Perm.Type     Constant
pfset Geom.background2.Perm.Value    5.0

pfset Geom.background3.Perm.Type     Constant
pfset Geom.background3.Perm.Value    5.0

pfset Geom.background4.Perm.Type     Constant
pfset Geom.background4.Perm.Value    5.0

pfset Geom.background5.Perm.Type     Constant
pfset Geom.background5.Perm.Value    5.0

pfset Geom.background6.Perm.Type     Constant
pfset Geom.background6.Perm.Value    5.0

pfset Geom.block1.Perm.Type     Constant
pfset Geom.block1.Perm.Value    5.0

pfset Geom.block2.Perm.Type     Constant
pfset Geom.block2.Perm.Value    5.0



pfset Perm.TensorType               TensorByGeom

pfset Geom.Perm.TensorByGeom.Names  "background"

pfset Geom.background.Perm.TensorValX  1.0
pfset Geom.background.Perm.TensorValY  1.0
pfset Geom.background.Perm.TensorValZ  1.0

#-----------------------------------------------------------------------------
# Phases
#-----------------------------------------------------------------------------

pfset Phase.Names "water"

pfset Phase.water.Density.Type	Constant
pfset Phase.water.Density.Value	1.0

pfset Phase.water.Viscosity.Type	Constant
pfset Phase.water.Viscosity.Value	1.0

#-----------------------------------------------------------------------------
# Gravity
#-----------------------------------------------------------------------------

pfset Gravity				1.0

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

pfset Geom.Porosity.GeomNames          background

pfset Geom.background.Porosity.Type    Constant
pfset Geom.background.Porosity.Value   0.4

#-----------------------------------------------------------------------------
# Domain
#-----------------------------------------------------------------------------
pfset Domain.GeomName domain

#-----------------------------------------------------------------------------
# Relative Permeability
#-----------------------------------------------------------------------------

pfset Phase.RelPerm.Type               VanGenuchten
pfset Phase.RelPerm.GeomNames          domain
pfset Geom.domain.RelPerm.Alpha        0.005
pfset Geom.domain.RelPerm.N            2.0    

#---------------------------------------------------------
# Saturation
#---------------------------------------------------------

pfset Phase.Saturation.Type            VanGenuchten
pfset Phase.Saturation.GeomNames       domain
pfset Geom.domain.Saturation.Alpha     0.5
pfset Geom.domain.Saturation.N         2.0
pfset Geom.domain.Saturation.SRes      0.2
pfset Geom.domain.Saturation.SSat      0.99

#-----------------------------------------------------------------------------
# Time Cycles
#-----------------------------------------------------------------------------
pfset Cycle.Names constant
pfset Cycle.constant.Names		"alltime"
pfset Cycle.constant.alltime.Length	 1
pfset Cycle.constant.Repeat		-1

#-----------------------------------------------------------------------------
# Boundary Conditions: Pressure
#-----------------------------------------------------------------------------
pfset BCPressure.PatchNames "left right front back bottom top"


pfset Patch.left.BCPressure.Type			FluxConst
pfset Patch.left.BCPressure.Cycle			"constant"
pfset Patch.left.BCPressure.alltime.Value		0.0

pfset Patch.right.BCPressure.Type			DirEquilRefPatch
pfset Patch.right.BCPressure.Cycle			"constant"
pfset Patch.right.BCPressure.RefGeom			domain
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


#---------------------------------------------------------
# Initial conditions: water pressure
#---------------------------------------------------------

pfset ICPressure.Type                                   HydroStaticPatch
pfset ICPressure.GeomNames                              domain
pfset Geom.domain.ICPressure.Value                      0.0
pfset Geom.domain.ICPressure.RefGeom                    domain
pfset Geom.domain.ICPressure.RefPatch                   bottom

#----------------------------------------------------------------------------
# Contaminants
#----------------------------------------------------------------------------
pfset Contaminants.Names ""

#----------------------------------------------------------------------------
# Wells
#----------------------------------------------------------------------------
pfset Wells.Names ""

#-----------------------------------------------------------------------------
# Phase sources:
#-----------------------------------------------------------------------------

pfset PhaseSources.water.Type                         Constant
pfset PhaseSources.water.GeomNames                    background
pfset PhaseSources.water.Geom.background.Value        0.0


#-----------------------------------------------------------------------------
# Exact solution specification for error calculations
#-----------------------------------------------------------------------------

pfset KnownSolution                                    NoKnownSolution


#-----------------------------------------------------------------------------
# Set solver parameters
#-----------------------------------------------------------------------------
pfset Solver                                             Richards
pfset Solver.MaxIter                                     1000000

pfset Solver.Nonlinear.MaxIter                           20
pfset Solver.Nonlinear.ResidualTol                       1e-1
pfset Solver.Nonlinear.EtaChoice                         EtaConstant
pfset Solver.Nonlinear.EtaValue                          1e-5
pfset Solver.Nonlinear.UseJacobian                       True
pfset Solver.Nonlinear.DerivativeEpsilon                 1e-2

pfset Solver.Linear.KrylovDimension                      10

pfset Solver.Linear.Preconditioner                       MGSemi
pfset Solver.Linear.Preconditioner.MGSemi.MaxIter        1
pfset Solver.Linear.Preconditioner.MGSemi.MaxLevels      100

pfset Solver.WriteSiloSubsurfData True
pfset Solver.WriteSiloPressure True
pfset Solver.WriteSiloSaturation True

#---------------------------------------------------------
# Topo slopes in x-direction
#---------------------------------------------------------
 
pfset TopoSlopesX.Type "Constant"
pfset TopoSlopesX.GeomNames "domain"
pfset TopoSlopesX.Geom.domain.Value 0.0000
 
#---------------------------------------------------------
# Topo slopes in y-direction
#---------------------------------------------------------
 
pfset TopoSlopesY.Type "Constant"
pfset TopoSlopesY.GeomNames "domain"
pfset TopoSlopesY.Geom.domain.Value 0.0000
 
#---------------------------------------------------------
# Mannings coefficient
#---------------------------------------------------------
 
pfset Mannings.Type "Constant"
pfset Mannings.GeomNames "domain"
pfset Mannings.Geom.domain.Value 2.3e-7

#-----------------------------------------------------------------------------
# Specific Storage
#-----------------------------------------------------------------------------
 
pfset SpecificStorage.Type            Constant
pfset SpecificStorage.GeomNames       "domain"
pfset Geom.domain.SpecificStorage.Value 1.0e-4
 
#-----------------------------------------------------------------------------
# Run and Unload the ParFlow output files
#-----------------------------------------------------------------------------
pfrun rect_domain
pfundist rect_domain

#-----------------------------------------------------------------------------
# If running as test; check output.
# You do not need this for normal PF input files; this is done so the examples
# are run and checked as part of our testing process.
#-----------------------------------------------------------------------------
if { [info exists ::env(PF_TEST) ] } {
    set TEST rect_domain
    source pftest.tcl
    set sig_digits 4

    set passed 1

    #
    # Tests 
    #
    if ![pftestFile $TEST.out.press.00001.pfb "Max difference in Pressure" $sig_digits] {
	set passed 0
    }

    if ![pftestFile $TEST.out.perm_x.pfb "Max difference in perm_x" $sig_digits] {
	set passed 0
    }
    if ![pftestFile $TEST.out.perm_y.pfb "Max difference in perm_y" $sig_digits] {
	set passed 0
    }
    if ![pftestFile $TEST.out.perm_z.pfb "Max difference in perm_z" $sig_digits] {
	set passed 0
    }

    if ![pftestFile $TEST.out.specific_storage.pfb "Max difference in specific storage" $sig_digits] {
	set passed 0
    }

    if ![pftestFile $TEST.out.porosity.pfb "Max difference in porosity" $sig_digits] {
	set passed 0
    }

    if $passed {
	puts "$TEST : PASSED"
    } {
	puts "$TEST : FAILED"
    }
}