??9
??
:
Add
x"T
y"T
z"T"
Ttype:
2	
A
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

?
DepthwiseConv2dNative

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%??8"-
data_formatstringNHWC:
NHWCNCHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
_
Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
E
Relu6
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
?
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape?
9
VarIsInitializedOp
resource
is_initialized
?"serve*
1.15.0-rc32v1.15.0-rc2-10-g38ea9bb8??4
?
sequential_1_inputPlaceholder*
dtype0*1
_output_shapes
:???????????*&
shape:???????????
~
input_1Placeholder*
dtype0*1
_output_shapes
:???????????*&
shape:???????????
?
Conv1_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
q
Conv1_pad/PadPadinput_1Conv1_pad/Pad/paddings*
T0*1
_output_shapes
:???????????
?
-Conv1/kernel/Initializer/random_uniform/shapeConst*%
valueB"            *
_class
loc:@Conv1/kernel*
dtype0*
_output_shapes
:
?
+Conv1/kernel/Initializer/random_uniform/minConst*
valueB
 *???*
_class
loc:@Conv1/kernel*
dtype0*
_output_shapes
: 
?
+Conv1/kernel/Initializer/random_uniform/maxConst*
valueB
 *??>*
_class
loc:@Conv1/kernel*
dtype0*
_output_shapes
: 
?
5Conv1/kernel/Initializer/random_uniform/RandomUniformRandomUniform-Conv1/kernel/Initializer/random_uniform/shape*
T0*
_class
loc:@Conv1/kernel*
dtype0*&
_output_shapes
:
?
+Conv1/kernel/Initializer/random_uniform/subSub+Conv1/kernel/Initializer/random_uniform/max+Conv1/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@Conv1/kernel*
_output_shapes
: 
?
+Conv1/kernel/Initializer/random_uniform/mulMul5Conv1/kernel/Initializer/random_uniform/RandomUniform+Conv1/kernel/Initializer/random_uniform/sub*&
_output_shapes
:*
T0*
_class
loc:@Conv1/kernel
?
'Conv1/kernel/Initializer/random_uniformAdd+Conv1/kernel/Initializer/random_uniform/mul+Conv1/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@Conv1/kernel*&
_output_shapes
:
?
Conv1/kernelVarHandleOp*
shared_nameConv1/kernel*
_class
loc:@Conv1/kernel*
dtype0*
_output_shapes
: *
shape:
i
-Conv1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv1/kernel*
_output_shapes
: 
k
Conv1/kernel/AssignAssignVariableOpConv1/kernel'Conv1/kernel/Initializer/random_uniform*
dtype0
u
 Conv1/kernel/Read/ReadVariableOpReadVariableOpConv1/kernel*
dtype0*&
_output_shapes
:
d
Conv1/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
p
Conv1/Conv2D/ReadVariableOpReadVariableOpConv1/kernel*
dtype0*&
_output_shapes
:
?
Conv1/Conv2DConv2DConv1_pad/PadConv1/Conv2D/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????pp
?
bn_Conv1/gamma/Initializer/onesConst*
valueB*  ??*!
_class
loc:@bn_Conv1/gamma*
dtype0*
_output_shapes
:
?
bn_Conv1/gammaVarHandleOp*
shared_namebn_Conv1/gamma*!
_class
loc:@bn_Conv1/gamma*
dtype0*
_output_shapes
: *
shape:
m
/bn_Conv1/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpbn_Conv1/gamma*
_output_shapes
: 
g
bn_Conv1/gamma/AssignAssignVariableOpbn_Conv1/gammabn_Conv1/gamma/Initializer/ones*
dtype0
m
"bn_Conv1/gamma/Read/ReadVariableOpReadVariableOpbn_Conv1/gamma*
dtype0*
_output_shapes
:
?
bn_Conv1/beta/Initializer/zerosConst*
valueB*    * 
_class
loc:@bn_Conv1/beta*
dtype0*
_output_shapes
:
?
bn_Conv1/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:*
shared_namebn_Conv1/beta* 
_class
loc:@bn_Conv1/beta
k
.bn_Conv1/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpbn_Conv1/beta*
_output_shapes
: 
e
bn_Conv1/beta/AssignAssignVariableOpbn_Conv1/betabn_Conv1/beta/Initializer/zeros*
dtype0
k
!bn_Conv1/beta/Read/ReadVariableOpReadVariableOpbn_Conv1/beta*
dtype0*
_output_shapes
:
?
&bn_Conv1/moving_mean/Initializer/zerosConst*
valueB*    *'
_class
loc:@bn_Conv1/moving_mean*
dtype0*
_output_shapes
:
?
bn_Conv1/moving_meanVarHandleOp*'
_class
loc:@bn_Conv1/moving_mean*
dtype0*
_output_shapes
: *
shape:*%
shared_namebn_Conv1/moving_mean
y
5bn_Conv1/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpbn_Conv1/moving_mean*
_output_shapes
: 
z
bn_Conv1/moving_mean/AssignAssignVariableOpbn_Conv1/moving_mean&bn_Conv1/moving_mean/Initializer/zeros*
dtype0
y
(bn_Conv1/moving_mean/Read/ReadVariableOpReadVariableOpbn_Conv1/moving_mean*
dtype0*
_output_shapes
:
?
)bn_Conv1/moving_variance/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@bn_Conv1/moving_variance*
dtype0*
_output_shapes
:
?
bn_Conv1/moving_varianceVarHandleOp*
shape:*)
shared_namebn_Conv1/moving_variance*+
_class!
loc:@bn_Conv1/moving_variance*
dtype0*
_output_shapes
: 
?
9bn_Conv1/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOpbn_Conv1/moving_variance*
_output_shapes
: 
?
bn_Conv1/moving_variance/AssignAssignVariableOpbn_Conv1/moving_variance)bn_Conv1/moving_variance/Initializer/ones*
dtype0
?
,bn_Conv1/moving_variance/Read/ReadVariableOpReadVariableOpbn_Conv1/moving_variance*
dtype0*
_output_shapes
:
b
bn_Conv1/ReadVariableOpReadVariableOpbn_Conv1/gamma*
dtype0*
_output_shapes
:
c
bn_Conv1/ReadVariableOp_1ReadVariableOpbn_Conv1/beta*
dtype0*
_output_shapes
:
y
(bn_Conv1/FusedBatchNormV3/ReadVariableOpReadVariableOpbn_Conv1/moving_mean*
dtype0*
_output_shapes
:

*bn_Conv1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpbn_Conv1/moving_variance*
dtype0*
_output_shapes
:
?
bn_Conv1/FusedBatchNormV3FusedBatchNormV3Conv1/Conv2Dbn_Conv1/ReadVariableOpbn_Conv1/ReadVariableOp_1(bn_Conv1/FusedBatchNormV3/ReadVariableOp*bn_Conv1/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????pp:::::*
is_training( 
S
bn_Conv1/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
n
Conv1_relu/Relu6Relu6bn_Conv1/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp
?
Iexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"            *;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Gexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *??J?*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Gexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *??J>*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Qexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformIexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:
?
Gexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/subSubGexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/maxGexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel
?
Gexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulQexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformGexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel*&
_output_shapes
:
?
Cexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniformAddGexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/mulGexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform/min*&
_output_shapes
:*
T0*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel
?
(expanded_conv_depthwise/depthwise_kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:*9
shared_name*(expanded_conv_depthwise/depthwise_kernel*;
_class1
/-loc:@expanded_conv_depthwise/depthwise_kernel
?
Iexpanded_conv_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp(expanded_conv_depthwise/depthwise_kernel*
_output_shapes
: 
?
/expanded_conv_depthwise/depthwise_kernel/AssignAssignVariableOp(expanded_conv_depthwise/depthwise_kernelCexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
<expanded_conv_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp(expanded_conv_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:
?
0expanded_conv_depthwise/depthwise/ReadVariableOpReadVariableOp(expanded_conv_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:
?
'expanded_conv_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"            
?
/expanded_conv_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
!expanded_conv_depthwise/depthwiseDepthwiseConv2dNativeConv1_relu/Relu60expanded_conv_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????pp*
paddingSAME
?
1expanded_conv_depthwise_BN/gamma/Initializer/onesConst*
valueB*  ??*3
_class)
'%loc:@expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
:
?
 expanded_conv_depthwise_BN/gammaVarHandleOp*1
shared_name" expanded_conv_depthwise_BN/gamma*3
_class)
'%loc:@expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:
?
Aexpanded_conv_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOp expanded_conv_depthwise_BN/gamma*
_output_shapes
: 
?
'expanded_conv_depthwise_BN/gamma/AssignAssignVariableOp expanded_conv_depthwise_BN/gamma1expanded_conv_depthwise_BN/gamma/Initializer/ones*
dtype0
?
4expanded_conv_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOp expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
:
?
1expanded_conv_depthwise_BN/beta/Initializer/zerosConst*
valueB*    *2
_class(
&$loc:@expanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
:
?
expanded_conv_depthwise_BN/betaVarHandleOp*
shape:*0
shared_name!expanded_conv_depthwise_BN/beta*2
_class(
&$loc:@expanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
@expanded_conv_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpexpanded_conv_depthwise_BN/beta*
_output_shapes
: 
?
&expanded_conv_depthwise_BN/beta/AssignAssignVariableOpexpanded_conv_depthwise_BN/beta1expanded_conv_depthwise_BN/beta/Initializer/zeros*
dtype0
?
3expanded_conv_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpexpanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
:
?
8expanded_conv_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@expanded_conv_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:
?
&expanded_conv_depthwise_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:*7
shared_name(&expanded_conv_depthwise_BN/moving_mean*9
_class/
-+loc:@expanded_conv_depthwise_BN/moving_mean
?
Gexpanded_conv_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp&expanded_conv_depthwise_BN/moving_mean*
_output_shapes
: 
?
-expanded_conv_depthwise_BN/moving_mean/AssignAssignVariableOp&expanded_conv_depthwise_BN/moving_mean8expanded_conv_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
:expanded_conv_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp&expanded_conv_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:
?
;expanded_conv_depthwise_BN/moving_variance/Initializer/onesConst*
valueB*  ??*=
_class3
1/loc:@expanded_conv_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:
?
*expanded_conv_depthwise_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:*;
shared_name,*expanded_conv_depthwise_BN/moving_variance*=
_class3
1/loc:@expanded_conv_depthwise_BN/moving_variance
?
Kexpanded_conv_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp*expanded_conv_depthwise_BN/moving_variance*
_output_shapes
: 
?
1expanded_conv_depthwise_BN/moving_variance/AssignAssignVariableOp*expanded_conv_depthwise_BN/moving_variance;expanded_conv_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
>expanded_conv_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp*expanded_conv_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:
?
)expanded_conv_depthwise_BN/ReadVariableOpReadVariableOp expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
:
?
+expanded_conv_depthwise_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
:
?
:expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp&expanded_conv_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:
?
<expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*expanded_conv_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:
?
+expanded_conv_depthwise_BN/FusedBatchNormV3FusedBatchNormV3!expanded_conv_depthwise/depthwise)expanded_conv_depthwise_BN/ReadVariableOp+expanded_conv_depthwise_BN/ReadVariableOp_1:expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp<expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????pp:::::*
is_training( *
epsilon%o?:*
T0*
U0
e
 expanded_conv_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
"expanded_conv_depthwise_relu/Relu6Relu6+expanded_conv_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp
?
=expanded_conv_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"            */
_class%
#!loc:@expanded_conv_project/kernel*
dtype0*
_output_shapes
:
?
;expanded_conv_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *   ?*/
_class%
#!loc:@expanded_conv_project/kernel
?
;expanded_conv_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *   ?*/
_class%
#!loc:@expanded_conv_project/kernel*
dtype0*
_output_shapes
: 
?
Eexpanded_conv_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform=expanded_conv_project/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:*
T0*/
_class%
#!loc:@expanded_conv_project/kernel
?
;expanded_conv_project/kernel/Initializer/random_uniform/subSub;expanded_conv_project/kernel/Initializer/random_uniform/max;expanded_conv_project/kernel/Initializer/random_uniform/min*
T0*/
_class%
#!loc:@expanded_conv_project/kernel*
_output_shapes
: 
?
;expanded_conv_project/kernel/Initializer/random_uniform/mulMulEexpanded_conv_project/kernel/Initializer/random_uniform/RandomUniform;expanded_conv_project/kernel/Initializer/random_uniform/sub*&
_output_shapes
:*
T0*/
_class%
#!loc:@expanded_conv_project/kernel
?
7expanded_conv_project/kernel/Initializer/random_uniformAdd;expanded_conv_project/kernel/Initializer/random_uniform/mul;expanded_conv_project/kernel/Initializer/random_uniform/min*&
_output_shapes
:*
T0*/
_class%
#!loc:@expanded_conv_project/kernel
?
expanded_conv_project/kernelVarHandleOp*-
shared_nameexpanded_conv_project/kernel*/
_class%
#!loc:@expanded_conv_project/kernel*
dtype0*
_output_shapes
: *
shape:
?
=expanded_conv_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpexpanded_conv_project/kernel*
_output_shapes
: 
?
#expanded_conv_project/kernel/AssignAssignVariableOpexpanded_conv_project/kernel7expanded_conv_project/kernel/Initializer/random_uniform*
dtype0
?
0expanded_conv_project/kernel/Read/ReadVariableOpReadVariableOpexpanded_conv_project/kernel*
dtype0*&
_output_shapes
:
t
#expanded_conv_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
+expanded_conv_project/Conv2D/ReadVariableOpReadVariableOpexpanded_conv_project/kernel*
dtype0*&
_output_shapes
:
?
expanded_conv_project/Conv2DConv2D"expanded_conv_depthwise_relu/Relu6+expanded_conv_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????pp*
paddingSAME
?
/expanded_conv_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*1
_class'
%#loc:@expanded_conv_project_BN/gamma
?
expanded_conv_project_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:*/
shared_name expanded_conv_project_BN/gamma*1
_class'
%#loc:@expanded_conv_project_BN/gamma
?
?expanded_conv_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpexpanded_conv_project_BN/gamma*
_output_shapes
: 
?
%expanded_conv_project_BN/gamma/AssignAssignVariableOpexpanded_conv_project_BN/gamma/expanded_conv_project_BN/gamma/Initializer/ones*
dtype0
?
2expanded_conv_project_BN/gamma/Read/ReadVariableOpReadVariableOpexpanded_conv_project_BN/gamma*
dtype0*
_output_shapes
:
?
/expanded_conv_project_BN/beta/Initializer/zerosConst*
valueB*    *0
_class&
$"loc:@expanded_conv_project_BN/beta*
dtype0*
_output_shapes
:
?
expanded_conv_project_BN/betaVarHandleOp*
shape:*.
shared_nameexpanded_conv_project_BN/beta*0
_class&
$"loc:@expanded_conv_project_BN/beta*
dtype0*
_output_shapes
: 
?
>expanded_conv_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpexpanded_conv_project_BN/beta*
_output_shapes
: 
?
$expanded_conv_project_BN/beta/AssignAssignVariableOpexpanded_conv_project_BN/beta/expanded_conv_project_BN/beta/Initializer/zeros*
dtype0
?
1expanded_conv_project_BN/beta/Read/ReadVariableOpReadVariableOpexpanded_conv_project_BN/beta*
dtype0*
_output_shapes
:
?
6expanded_conv_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *7
_class-
+)loc:@expanded_conv_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
$expanded_conv_project_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:*5
shared_name&$expanded_conv_project_BN/moving_mean*7
_class-
+)loc:@expanded_conv_project_BN/moving_mean
?
Eexpanded_conv_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp$expanded_conv_project_BN/moving_mean*
_output_shapes
: 
?
+expanded_conv_project_BN/moving_mean/AssignAssignVariableOp$expanded_conv_project_BN/moving_mean6expanded_conv_project_BN/moving_mean/Initializer/zeros*
dtype0
?
8expanded_conv_project_BN/moving_mean/Read/ReadVariableOpReadVariableOp$expanded_conv_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
9expanded_conv_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*;
_class1
/-loc:@expanded_conv_project_BN/moving_variance
?
(expanded_conv_project_BN/moving_varianceVarHandleOp*;
_class1
/-loc:@expanded_conv_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:*9
shared_name*(expanded_conv_project_BN/moving_variance
?
Iexpanded_conv_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp(expanded_conv_project_BN/moving_variance*
_output_shapes
: 
?
/expanded_conv_project_BN/moving_variance/AssignAssignVariableOp(expanded_conv_project_BN/moving_variance9expanded_conv_project_BN/moving_variance/Initializer/ones*
dtype0
?
<expanded_conv_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp(expanded_conv_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
'expanded_conv_project_BN/ReadVariableOpReadVariableOpexpanded_conv_project_BN/gamma*
dtype0*
_output_shapes
:
?
)expanded_conv_project_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_project_BN/beta*
dtype0*
_output_shapes
:
?
8expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp$expanded_conv_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
:expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp(expanded_conv_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
)expanded_conv_project_BN/FusedBatchNormV3FusedBatchNormV3expanded_conv_project/Conv2D'expanded_conv_project_BN/ReadVariableOp)expanded_conv_project_BN/ReadVariableOp_18expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp:expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????pp:::::*
is_training( *
epsilon%o?:*
T0*
U0
c
expanded_conv_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
6block_1_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         0   *(
_class
loc:@block_1_expand/kernel
?
4block_1_expand/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *b???*(
_class
loc:@block_1_expand/kernel
?
4block_1_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b??>*(
_class
loc:@block_1_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_1_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_1_expand/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:0*
T0*(
_class
loc:@block_1_expand/kernel
?
4block_1_expand/kernel/Initializer/random_uniform/subSub4block_1_expand/kernel/Initializer/random_uniform/max4block_1_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_1_expand/kernel*
_output_shapes
: 
?
4block_1_expand/kernel/Initializer/random_uniform/mulMul>block_1_expand/kernel/Initializer/random_uniform/RandomUniform4block_1_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_1_expand/kernel*&
_output_shapes
:0
?
0block_1_expand/kernel/Initializer/random_uniformAdd4block_1_expand/kernel/Initializer/random_uniform/mul4block_1_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_1_expand/kernel*&
_output_shapes
:0
?
block_1_expand/kernelVarHandleOp*(
_class
loc:@block_1_expand/kernel*
dtype0*
_output_shapes
: *
shape:0*&
shared_nameblock_1_expand/kernel
{
6block_1_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_expand/kernel*
_output_shapes
: 
?
block_1_expand/kernel/AssignAssignVariableOpblock_1_expand/kernel0block_1_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_1_expand/kernel/Read/ReadVariableOpReadVariableOpblock_1_expand/kernel*
dtype0*&
_output_shapes
:0
m
block_1_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_1_expand/Conv2D/ReadVariableOpReadVariableOpblock_1_expand/kernel*
dtype0*&
_output_shapes
:0
?
block_1_expand/Conv2DConv2D)expanded_conv_project_BN/FusedBatchNormV3$block_1_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????pp0*
paddingSAME*
T0
?
(block_1_expand_BN/gamma/Initializer/onesConst*
valueB0*  ??**
_class 
loc:@block_1_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
block_1_expand_BN/gammaVarHandleOp**
_class 
loc:@block_1_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:0*(
shared_nameblock_1_expand_BN/gamma

8block_1_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_expand_BN/gamma*
_output_shapes
: 
?
block_1_expand_BN/gamma/AssignAssignVariableOpblock_1_expand_BN/gamma(block_1_expand_BN/gamma/Initializer/ones*
dtype0

+block_1_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_1_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
(block_1_expand_BN/beta/Initializer/zerosConst*
valueB0*    *)
_class
loc:@block_1_expand_BN/beta*
dtype0*
_output_shapes
:0
?
block_1_expand_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*'
shared_nameblock_1_expand_BN/beta*)
_class
loc:@block_1_expand_BN/beta
}
7block_1_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_expand_BN/beta*
_output_shapes
: 
?
block_1_expand_BN/beta/AssignAssignVariableOpblock_1_expand_BN/beta(block_1_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_1_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_1_expand_BN/beta*
dtype0*
_output_shapes
:0
?
/block_1_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:0*
valueB0*    *0
_class&
$"loc:@block_1_expand_BN/moving_mean
?
block_1_expand_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*.
shared_nameblock_1_expand_BN/moving_mean*0
_class&
$"loc:@block_1_expand_BN/moving_mean
?
>block_1_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_expand_BN/moving_mean*
_output_shapes
: 
?
$block_1_expand_BN/moving_mean/AssignAssignVariableOpblock_1_expand_BN/moving_mean/block_1_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_1_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_1_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
2block_1_expand_BN/moving_variance/Initializer/onesConst*
valueB0*  ??*4
_class*
(&loc:@block_1_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
!block_1_expand_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*2
shared_name#!block_1_expand_BN/moving_variance*4
_class*
(&loc:@block_1_expand_BN/moving_variance
?
Bblock_1_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_1_expand_BN/moving_variance*
_output_shapes
: 
?
(block_1_expand_BN/moving_variance/AssignAssignVariableOp!block_1_expand_BN/moving_variance2block_1_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_1_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_1_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
t
 block_1_expand_BN/ReadVariableOpReadVariableOpblock_1_expand_BN/gamma*
dtype0*
_output_shapes
:0
u
"block_1_expand_BN/ReadVariableOp_1ReadVariableOpblock_1_expand_BN/beta*
dtype0*
_output_shapes
:0
?
1block_1_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
3block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_1_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
"block_1_expand_BN/FusedBatchNormV3FusedBatchNormV3block_1_expand/Conv2D block_1_expand_BN/ReadVariableOp"block_1_expand_BN/ReadVariableOp_11block_1_expand_BN/FusedBatchNormV3/ReadVariableOp3block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????pp0:0:0:0:0:*
is_training( 
\
block_1_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_1_expand_relu/Relu6Relu6"block_1_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp0
?
block_1_pad/Pad/paddingsConst*
dtype0*
_output_shapes

:*9
value0B."                               
?
block_1_pad/PadPadblock_1_expand_relu/Relu6block_1_pad/Pad/paddings*
T0*/
_output_shapes
:?????????qq0
?
Cblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      0      *5
_class+
)'loc:@block_1_depthwise/depthwise_kernel
?
Ablock_1_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *2???*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_1_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *2??=*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:0*
T0*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel
?
Ablock_1_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel
?
Ablock_1_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel*&
_output_shapes
:0
?
=block_1_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_1_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel*&
_output_shapes
:0
?
"block_1_depthwise/depthwise_kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*3
shared_name$"block_1_depthwise/depthwise_kernel*5
_class+
)'loc:@block_1_depthwise/depthwise_kernel
?
Cblock_1_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_1_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_1_depthwise/depthwise_kernel/AssignAssignVariableOp"block_1_depthwise/depthwise_kernel=block_1_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_1_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_1_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
*block_1_depthwise/depthwise/ReadVariableOpReadVariableOp"block_1_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
z
!block_1_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
z
)block_1_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_1_depthwise/depthwiseDepthwiseConv2dNativeblock_1_pad/Pad*block_1_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????880
?
+block_1_depthwise_BN/gamma/Initializer/onesConst*
valueB0*  ??*-
_class#
!loc:@block_1_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
block_1_depthwise_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*+
shared_nameblock_1_depthwise_BN/gamma*-
_class#
!loc:@block_1_depthwise_BN/gamma
?
;block_1_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_depthwise_BN/gamma*
_output_shapes
: 
?
!block_1_depthwise_BN/gamma/AssignAssignVariableOpblock_1_depthwise_BN/gamma+block_1_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_1_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_1_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
+block_1_depthwise_BN/beta/Initializer/zerosConst*
valueB0*    *,
_class"
 loc:@block_1_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
block_1_depthwise_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:0**
shared_nameblock_1_depthwise_BN/beta*,
_class"
 loc:@block_1_depthwise_BN/beta
?
:block_1_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_depthwise_BN/beta*
_output_shapes
: 
?
 block_1_depthwise_BN/beta/AssignAssignVariableOpblock_1_depthwise_BN/beta+block_1_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_1_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_1_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
2block_1_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB0*    *3
_class)
'%loc:@block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
 block_1_depthwise_BN/moving_meanVarHandleOp*
shape:0*1
shared_name" block_1_depthwise_BN/moving_mean*3
_class)
'%loc:@block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: 
?
Ablock_1_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_1_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_1_depthwise_BN/moving_mean/AssignAssignVariableOp block_1_depthwise_BN/moving_mean2block_1_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_1_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
5block_1_depthwise_BN/moving_variance/Initializer/onesConst*
valueB0*  ??*7
_class-
+)loc:@block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
$block_1_depthwise_BN/moving_varianceVarHandleOp*5
shared_name&$block_1_depthwise_BN/moving_variance*7
_class-
+)loc:@block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:0
?
Eblock_1_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_1_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_1_depthwise_BN/moving_variance/AssignAssignVariableOp$block_1_depthwise_BN/moving_variance5block_1_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_1_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
z
#block_1_depthwise_BN/ReadVariableOpReadVariableOpblock_1_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
{
%block_1_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_1_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
4block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
6block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
%block_1_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_1_depthwise/depthwise#block_1_depthwise_BN/ReadVariableOp%block_1_depthwise_BN/ReadVariableOp_14block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( *
epsilon%o?:
_
block_1_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_1_depthwise_relu/Relu6Relu6%block_1_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
7block_1_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      0      *)
_class
loc:@block_1_project/kernel*
dtype0*
_output_shapes
:
?
5block_1_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *b???*)
_class
loc:@block_1_project/kernel
?
5block_1_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *b??>*)
_class
loc:@block_1_project/kernel*
dtype0*
_output_shapes
: 
?
?block_1_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_1_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_1_project/kernel*
dtype0*&
_output_shapes
:0
?
5block_1_project/kernel/Initializer/random_uniform/subSub5block_1_project/kernel/Initializer/random_uniform/max5block_1_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_1_project/kernel
?
5block_1_project/kernel/Initializer/random_uniform/mulMul?block_1_project/kernel/Initializer/random_uniform/RandomUniform5block_1_project/kernel/Initializer/random_uniform/sub*&
_output_shapes
:0*
T0*)
_class
loc:@block_1_project/kernel
?
1block_1_project/kernel/Initializer/random_uniformAdd5block_1_project/kernel/Initializer/random_uniform/mul5block_1_project/kernel/Initializer/random_uniform/min*&
_output_shapes
:0*
T0*)
_class
loc:@block_1_project/kernel
?
block_1_project/kernelVarHandleOp*)
_class
loc:@block_1_project/kernel*
dtype0*
_output_shapes
: *
shape:0*'
shared_nameblock_1_project/kernel
}
7block_1_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_project/kernel*
_output_shapes
: 
?
block_1_project/kernel/AssignAssignVariableOpblock_1_project/kernel1block_1_project/kernel/Initializer/random_uniform*
dtype0
?
*block_1_project/kernel/Read/ReadVariableOpReadVariableOpblock_1_project/kernel*
dtype0*&
_output_shapes
:0
n
block_1_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_1_project/Conv2D/ReadVariableOpReadVariableOpblock_1_project/kernel*
dtype0*&
_output_shapes
:0
?
block_1_project/Conv2DConv2Dblock_1_depthwise_relu/Relu6%block_1_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????88*
paddingSAME
?
)block_1_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*+
_class!
loc:@block_1_project_BN/gamma
?
block_1_project_BN/gammaVarHandleOp*+
_class!
loc:@block_1_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:*)
shared_nameblock_1_project_BN/gamma
?
9block_1_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_project_BN/gamma*
_output_shapes
: 
?
block_1_project_BN/gamma/AssignAssignVariableOpblock_1_project_BN/gamma)block_1_project_BN/gamma/Initializer/ones*
dtype0
?
,block_1_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_1_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_1_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_1_project_BN/beta*
dtype0*
_output_shapes
:
?
block_1_project_BN/betaVarHandleOp*(
shared_nameblock_1_project_BN/beta**
_class 
loc:@block_1_project_BN/beta*
dtype0*
_output_shapes
: *
shape:

8block_1_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_project_BN/beta*
_output_shapes
: 
?
block_1_project_BN/beta/AssignAssignVariableOpblock_1_project_BN/beta)block_1_project_BN/beta/Initializer/zeros*
dtype0

+block_1_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_1_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_1_project_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *1
_class'
%#loc:@block_1_project_BN/moving_mean
?
block_1_project_BN/moving_meanVarHandleOp*
shape:*/
shared_name block_1_project_BN/moving_mean*1
_class'
%#loc:@block_1_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
?block_1_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_1_project_BN/moving_mean*
_output_shapes
: 
?
%block_1_project_BN/moving_mean/AssignAssignVariableOpblock_1_project_BN/moving_mean0block_1_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_1_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_1_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_1_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*5
_class+
)'loc:@block_1_project_BN/moving_variance
?
"block_1_project_BN/moving_varianceVarHandleOp*
shape:*3
shared_name$"block_1_project_BN/moving_variance*5
_class+
)'loc:@block_1_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_1_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_1_project_BN/moving_variance*
_output_shapes
: 
?
)block_1_project_BN/moving_variance/AssignAssignVariableOp"block_1_project_BN/moving_variance3block_1_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_1_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_1_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_1_project_BN/ReadVariableOpReadVariableOpblock_1_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_1_project_BN/ReadVariableOp_1ReadVariableOpblock_1_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_1_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_1_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_1_project_BN/FusedBatchNormV3FusedBatchNormV3block_1_project/Conv2D!block_1_project_BN/ReadVariableOp#block_1_project_BN/ReadVariableOp_12block_1_project_BN/FusedBatchNormV3/ReadVariableOp4block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????88:::::*
is_training( *
epsilon%o?:
]
block_1_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
6block_2_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"         0   *(
_class
loc:@block_2_expand/kernel*
dtype0*
_output_shapes
:
?
4block_2_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *b???*(
_class
loc:@block_2_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_2_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b??>*(
_class
loc:@block_2_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_2_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_2_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_2_expand/kernel*
dtype0*&
_output_shapes
:0
?
4block_2_expand/kernel/Initializer/random_uniform/subSub4block_2_expand/kernel/Initializer/random_uniform/max4block_2_expand/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*(
_class
loc:@block_2_expand/kernel
?
4block_2_expand/kernel/Initializer/random_uniform/mulMul>block_2_expand/kernel/Initializer/random_uniform/RandomUniform4block_2_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_2_expand/kernel*&
_output_shapes
:0
?
0block_2_expand/kernel/Initializer/random_uniformAdd4block_2_expand/kernel/Initializer/random_uniform/mul4block_2_expand/kernel/Initializer/random_uniform/min*&
_output_shapes
:0*
T0*(
_class
loc:@block_2_expand/kernel
?
block_2_expand/kernelVarHandleOp*
shape:0*&
shared_nameblock_2_expand/kernel*(
_class
loc:@block_2_expand/kernel*
dtype0*
_output_shapes
: 
{
6block_2_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_expand/kernel*
_output_shapes
: 
?
block_2_expand/kernel/AssignAssignVariableOpblock_2_expand/kernel0block_2_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_2_expand/kernel/Read/ReadVariableOpReadVariableOpblock_2_expand/kernel*
dtype0*&
_output_shapes
:0
m
block_2_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_2_expand/Conv2D/ReadVariableOpReadVariableOpblock_2_expand/kernel*
dtype0*&
_output_shapes
:0
?
block_2_expand/Conv2DConv2D#block_1_project_BN/FusedBatchNormV3$block_2_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????880*
paddingSAME
?
(block_2_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:0*
valueB0*  ??**
_class 
loc:@block_2_expand_BN/gamma
?
block_2_expand_BN/gammaVarHandleOp**
_class 
loc:@block_2_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:0*(
shared_nameblock_2_expand_BN/gamma

8block_2_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_expand_BN/gamma*
_output_shapes
: 
?
block_2_expand_BN/gamma/AssignAssignVariableOpblock_2_expand_BN/gamma(block_2_expand_BN/gamma/Initializer/ones*
dtype0

+block_2_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_2_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
(block_2_expand_BN/beta/Initializer/zerosConst*
valueB0*    *)
_class
loc:@block_2_expand_BN/beta*
dtype0*
_output_shapes
:0
?
block_2_expand_BN/betaVarHandleOp*)
_class
loc:@block_2_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:0*'
shared_nameblock_2_expand_BN/beta
}
7block_2_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_expand_BN/beta*
_output_shapes
: 
?
block_2_expand_BN/beta/AssignAssignVariableOpblock_2_expand_BN/beta(block_2_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_2_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_2_expand_BN/beta*
dtype0*
_output_shapes
:0
?
/block_2_expand_BN/moving_mean/Initializer/zerosConst*
valueB0*    *0
_class&
$"loc:@block_2_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
block_2_expand_BN/moving_meanVarHandleOp*0
_class&
$"loc:@block_2_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:0*.
shared_nameblock_2_expand_BN/moving_mean
?
>block_2_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_expand_BN/moving_mean*
_output_shapes
: 
?
$block_2_expand_BN/moving_mean/AssignAssignVariableOpblock_2_expand_BN/moving_mean/block_2_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_2_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_2_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
2block_2_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:0*
valueB0*  ??*4
_class*
(&loc:@block_2_expand_BN/moving_variance
?
!block_2_expand_BN/moving_varianceVarHandleOp*4
_class*
(&loc:@block_2_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:0*2
shared_name#!block_2_expand_BN/moving_variance
?
Bblock_2_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_2_expand_BN/moving_variance*
_output_shapes
: 
?
(block_2_expand_BN/moving_variance/AssignAssignVariableOp!block_2_expand_BN/moving_variance2block_2_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_2_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_2_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
t
 block_2_expand_BN/ReadVariableOpReadVariableOpblock_2_expand_BN/gamma*
dtype0*
_output_shapes
:0
u
"block_2_expand_BN/ReadVariableOp_1ReadVariableOpblock_2_expand_BN/beta*
dtype0*
_output_shapes
:0
?
1block_2_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
3block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_2_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
"block_2_expand_BN/FusedBatchNormV3FusedBatchNormV3block_2_expand/Conv2D block_2_expand_BN/ReadVariableOp"block_2_expand_BN/ReadVariableOp_11block_2_expand_BN/FusedBatchNormV3/ReadVariableOp3block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????880:0:0:0:0:*
epsilon%o?:*
T0*
U0
\
block_2_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_2_expand_relu/Relu6Relu6"block_2_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
Cblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      0      *5
_class+
)'loc:@block_2_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_2_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *2???*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel
?
Ablock_2_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *2??=*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:0*
T0*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel
?
Ablock_2_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_2_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/sub*&
_output_shapes
:0*
T0*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel
?
=block_2_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_2_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel*&
_output_shapes
:0
?
"block_2_depthwise/depthwise_kernelVarHandleOp*5
_class+
)'loc:@block_2_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: *
shape:0*3
shared_name$"block_2_depthwise/depthwise_kernel
?
Cblock_2_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_2_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_2_depthwise/depthwise_kernel/AssignAssignVariableOp"block_2_depthwise/depthwise_kernel=block_2_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_2_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_2_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
*block_2_depthwise/depthwise/ReadVariableOpReadVariableOp"block_2_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
z
!block_2_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      0      
z
)block_2_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_2_depthwise/depthwiseDepthwiseConv2dNativeblock_2_expand_relu/Relu6*block_2_depthwise/depthwise/ReadVariableOp*
strides
*/
_output_shapes
:?????????880*
paddingSAME*
T0
?
+block_2_depthwise_BN/gamma/Initializer/onesConst*
valueB0*  ??*-
_class#
!loc:@block_2_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
block_2_depthwise_BN/gammaVarHandleOp*+
shared_nameblock_2_depthwise_BN/gamma*-
_class#
!loc:@block_2_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:0
?
;block_2_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_depthwise_BN/gamma*
_output_shapes
: 
?
!block_2_depthwise_BN/gamma/AssignAssignVariableOpblock_2_depthwise_BN/gamma+block_2_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_2_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_2_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
+block_2_depthwise_BN/beta/Initializer/zerosConst*
valueB0*    *,
_class"
 loc:@block_2_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
block_2_depthwise_BN/betaVarHandleOp*,
_class"
 loc:@block_2_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:0**
shared_nameblock_2_depthwise_BN/beta
?
:block_2_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_depthwise_BN/beta*
_output_shapes
: 
?
 block_2_depthwise_BN/beta/AssignAssignVariableOpblock_2_depthwise_BN/beta+block_2_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_2_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_2_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
2block_2_depthwise_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:0*
valueB0*    *3
_class)
'%loc:@block_2_depthwise_BN/moving_mean
?
 block_2_depthwise_BN/moving_meanVarHandleOp*1
shared_name" block_2_depthwise_BN/moving_mean*3
_class)
'%loc:@block_2_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:0
?
Ablock_2_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_2_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_2_depthwise_BN/moving_mean/AssignAssignVariableOp block_2_depthwise_BN/moving_mean2block_2_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_2_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_2_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
5block_2_depthwise_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:0*
valueB0*  ??*7
_class-
+)loc:@block_2_depthwise_BN/moving_variance
?
$block_2_depthwise_BN/moving_varianceVarHandleOp*
shape:0*5
shared_name&$block_2_depthwise_BN/moving_variance*7
_class-
+)loc:@block_2_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Eblock_2_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_2_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_2_depthwise_BN/moving_variance/AssignAssignVariableOp$block_2_depthwise_BN/moving_variance5block_2_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_2_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_2_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
z
#block_2_depthwise_BN/ReadVariableOpReadVariableOpblock_2_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
{
%block_2_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_2_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
4block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_2_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
6block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_2_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
%block_2_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_2_depthwise/depthwise#block_2_depthwise_BN/ReadVariableOp%block_2_depthwise_BN/ReadVariableOp_14block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( 
_
block_2_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_2_depthwise_relu/Relu6Relu6%block_2_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
7block_2_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      0      *)
_class
loc:@block_2_project/kernel*
dtype0*
_output_shapes
:
?
5block_2_project/kernel/Initializer/random_uniform/minConst*
valueB
 *b???*)
_class
loc:@block_2_project/kernel*
dtype0*
_output_shapes
: 
?
5block_2_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *b??>*)
_class
loc:@block_2_project/kernel*
dtype0*
_output_shapes
: 
?
?block_2_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_2_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_2_project/kernel*
dtype0*&
_output_shapes
:0
?
5block_2_project/kernel/Initializer/random_uniform/subSub5block_2_project/kernel/Initializer/random_uniform/max5block_2_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_2_project/kernel*
_output_shapes
: 
?
5block_2_project/kernel/Initializer/random_uniform/mulMul?block_2_project/kernel/Initializer/random_uniform/RandomUniform5block_2_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_2_project/kernel*&
_output_shapes
:0
?
1block_2_project/kernel/Initializer/random_uniformAdd5block_2_project/kernel/Initializer/random_uniform/mul5block_2_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_2_project/kernel*&
_output_shapes
:0
?
block_2_project/kernelVarHandleOp*)
_class
loc:@block_2_project/kernel*
dtype0*
_output_shapes
: *
shape:0*'
shared_nameblock_2_project/kernel
}
7block_2_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_project/kernel*
_output_shapes
: 
?
block_2_project/kernel/AssignAssignVariableOpblock_2_project/kernel1block_2_project/kernel/Initializer/random_uniform*
dtype0
?
*block_2_project/kernel/Read/ReadVariableOpReadVariableOpblock_2_project/kernel*
dtype0*&
_output_shapes
:0
n
block_2_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_2_project/Conv2D/ReadVariableOpReadVariableOpblock_2_project/kernel*
dtype0*&
_output_shapes
:0
?
block_2_project/Conv2DConv2Dblock_2_depthwise_relu/Relu6%block_2_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????88*
paddingSAME
?
)block_2_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_2_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_2_project_BN/gammaVarHandleOp*)
shared_nameblock_2_project_BN/gamma*+
_class!
loc:@block_2_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:
?
9block_2_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_project_BN/gamma*
_output_shapes
: 
?
block_2_project_BN/gamma/AssignAssignVariableOpblock_2_project_BN/gamma)block_2_project_BN/gamma/Initializer/ones*
dtype0
?
,block_2_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_2_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_2_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_2_project_BN/beta*
dtype0*
_output_shapes
:
?
block_2_project_BN/betaVarHandleOp*
shape:*(
shared_nameblock_2_project_BN/beta**
_class 
loc:@block_2_project_BN/beta*
dtype0*
_output_shapes
: 

8block_2_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_project_BN/beta*
_output_shapes
: 
?
block_2_project_BN/beta/AssignAssignVariableOpblock_2_project_BN/beta)block_2_project_BN/beta/Initializer/zeros*
dtype0

+block_2_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_2_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_2_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_2_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_2_project_BN/moving_meanVarHandleOp*1
_class'
%#loc:@block_2_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:*/
shared_name block_2_project_BN/moving_mean
?
?block_2_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_2_project_BN/moving_mean*
_output_shapes
: 
?
%block_2_project_BN/moving_mean/AssignAssignVariableOpblock_2_project_BN/moving_mean0block_2_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_2_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_2_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_2_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_2_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_2_project_BN/moving_varianceVarHandleOp*
shape:*3
shared_name$"block_2_project_BN/moving_variance*5
_class+
)'loc:@block_2_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_2_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_2_project_BN/moving_variance*
_output_shapes
: 
?
)block_2_project_BN/moving_variance/AssignAssignVariableOp"block_2_project_BN/moving_variance3block_2_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_2_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_2_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_2_project_BN/ReadVariableOpReadVariableOpblock_2_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_2_project_BN/ReadVariableOp_1ReadVariableOpblock_2_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_2_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_2_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_2_project_BN/FusedBatchNormV3FusedBatchNormV3block_2_project/Conv2D!block_2_project_BN/ReadVariableOp#block_2_project_BN/ReadVariableOp_12block_2_project_BN/FusedBatchNormV3/ReadVariableOp4block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????88:::::*
is_training( *
epsilon%o?:
]
block_2_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_2_add/addAddV2#block_1_project_BN/FusedBatchNormV3#block_2_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????88*
T0
?
6block_3_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         0   *(
_class
loc:@block_3_expand/kernel
?
4block_3_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *b???*(
_class
loc:@block_3_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_3_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b??>*(
_class
loc:@block_3_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_3_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_3_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_3_expand/kernel*
dtype0*&
_output_shapes
:0
?
4block_3_expand/kernel/Initializer/random_uniform/subSub4block_3_expand/kernel/Initializer/random_uniform/max4block_3_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_3_expand/kernel*
_output_shapes
: 
?
4block_3_expand/kernel/Initializer/random_uniform/mulMul>block_3_expand/kernel/Initializer/random_uniform/RandomUniform4block_3_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_3_expand/kernel*&
_output_shapes
:0
?
0block_3_expand/kernel/Initializer/random_uniformAdd4block_3_expand/kernel/Initializer/random_uniform/mul4block_3_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_3_expand/kernel*&
_output_shapes
:0
?
block_3_expand/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*&
shared_nameblock_3_expand/kernel*(
_class
loc:@block_3_expand/kernel
{
6block_3_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_expand/kernel*
_output_shapes
: 
?
block_3_expand/kernel/AssignAssignVariableOpblock_3_expand/kernel0block_3_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_3_expand/kernel/Read/ReadVariableOpReadVariableOpblock_3_expand/kernel*
dtype0*&
_output_shapes
:0
m
block_3_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_3_expand/Conv2D/ReadVariableOpReadVariableOpblock_3_expand/kernel*
dtype0*&
_output_shapes
:0
?
block_3_expand/Conv2DConv2Dblock_2_add/add$block_3_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????880*
paddingSAME
?
(block_3_expand_BN/gamma/Initializer/onesConst*
valueB0*  ??**
_class 
loc:@block_3_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
block_3_expand_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*(
shared_nameblock_3_expand_BN/gamma**
_class 
loc:@block_3_expand_BN/gamma

8block_3_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_expand_BN/gamma*
_output_shapes
: 
?
block_3_expand_BN/gamma/AssignAssignVariableOpblock_3_expand_BN/gamma(block_3_expand_BN/gamma/Initializer/ones*
dtype0

+block_3_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_3_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
(block_3_expand_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:0*
valueB0*    *)
_class
loc:@block_3_expand_BN/beta
?
block_3_expand_BN/betaVarHandleOp*)
_class
loc:@block_3_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:0*'
shared_nameblock_3_expand_BN/beta
}
7block_3_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_expand_BN/beta*
_output_shapes
: 
?
block_3_expand_BN/beta/AssignAssignVariableOpblock_3_expand_BN/beta(block_3_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_3_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_3_expand_BN/beta*
dtype0*
_output_shapes
:0
?
/block_3_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:0*
valueB0*    *0
_class&
$"loc:@block_3_expand_BN/moving_mean
?
block_3_expand_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:0*.
shared_nameblock_3_expand_BN/moving_mean*0
_class&
$"loc:@block_3_expand_BN/moving_mean
?
>block_3_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_expand_BN/moving_mean*
_output_shapes
: 
?
$block_3_expand_BN/moving_mean/AssignAssignVariableOpblock_3_expand_BN/moving_mean/block_3_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_3_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_3_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
2block_3_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:0*
valueB0*  ??*4
_class*
(&loc:@block_3_expand_BN/moving_variance
?
!block_3_expand_BN/moving_varianceVarHandleOp*2
shared_name#!block_3_expand_BN/moving_variance*4
_class*
(&loc:@block_3_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:0
?
Bblock_3_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_3_expand_BN/moving_variance*
_output_shapes
: 
?
(block_3_expand_BN/moving_variance/AssignAssignVariableOp!block_3_expand_BN/moving_variance2block_3_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_3_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_3_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
t
 block_3_expand_BN/ReadVariableOpReadVariableOpblock_3_expand_BN/gamma*
dtype0*
_output_shapes
:0
u
"block_3_expand_BN/ReadVariableOp_1ReadVariableOpblock_3_expand_BN/beta*
dtype0*
_output_shapes
:0
?
1block_3_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
3block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_3_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
"block_3_expand_BN/FusedBatchNormV3FusedBatchNormV3block_3_expand/Conv2D block_3_expand_BN/ReadVariableOp"block_3_expand_BN/ReadVariableOp_11block_3_expand_BN/FusedBatchNormV3/ReadVariableOp3block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????880:0:0:0:0:
\
block_3_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_3_expand_relu/Relu6Relu6"block_3_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
block_3_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
block_3_pad/PadPadblock_3_expand_relu/Relu6block_3_pad/Pad/paddings*/
_output_shapes
:?????????990*
T0
?
Cblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      0      *5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_3_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *2???*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_3_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *2??=*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel
?
Kblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
Ablock_3_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_3_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*&
_output_shapes
:0
?
=block_3_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_3_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*&
_output_shapes
:0
?
"block_3_depthwise/depthwise_kernelVarHandleOp*
shape:0*3
shared_name$"block_3_depthwise/depthwise_kernel*5
_class+
)'loc:@block_3_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Cblock_3_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_3_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_3_depthwise/depthwise_kernel/AssignAssignVariableOp"block_3_depthwise/depthwise_kernel=block_3_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_3_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_3_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
*block_3_depthwise/depthwise/ReadVariableOpReadVariableOp"block_3_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
z
!block_3_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
z
)block_3_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_3_depthwise/depthwiseDepthwiseConv2dNativeblock_3_pad/Pad*block_3_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????0*
paddingVALID
?
+block_3_depthwise_BN/gamma/Initializer/onesConst*
valueB0*  ??*-
_class#
!loc:@block_3_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
block_3_depthwise_BN/gammaVarHandleOp*
shape:0*+
shared_nameblock_3_depthwise_BN/gamma*-
_class#
!loc:@block_3_depthwise_BN/gamma*
dtype0*
_output_shapes
: 
?
;block_3_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_depthwise_BN/gamma*
_output_shapes
: 
?
!block_3_depthwise_BN/gamma/AssignAssignVariableOpblock_3_depthwise_BN/gamma+block_3_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_3_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_3_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
+block_3_depthwise_BN/beta/Initializer/zerosConst*
valueB0*    *,
_class"
 loc:@block_3_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
block_3_depthwise_BN/betaVarHandleOp**
shared_nameblock_3_depthwise_BN/beta*,
_class"
 loc:@block_3_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:0
?
:block_3_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_depthwise_BN/beta*
_output_shapes
: 
?
 block_3_depthwise_BN/beta/AssignAssignVariableOpblock_3_depthwise_BN/beta+block_3_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_3_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_3_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
2block_3_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB0*    *3
_class)
'%loc:@block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
 block_3_depthwise_BN/moving_meanVarHandleOp*1
shared_name" block_3_depthwise_BN/moving_mean*3
_class)
'%loc:@block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:0
?
Ablock_3_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_3_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_3_depthwise_BN/moving_mean/AssignAssignVariableOp block_3_depthwise_BN/moving_mean2block_3_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_3_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
5block_3_depthwise_BN/moving_variance/Initializer/onesConst*
valueB0*  ??*7
_class-
+)loc:@block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
$block_3_depthwise_BN/moving_varianceVarHandleOp*5
shared_name&$block_3_depthwise_BN/moving_variance*7
_class-
+)loc:@block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:0
?
Eblock_3_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_3_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_3_depthwise_BN/moving_variance/AssignAssignVariableOp$block_3_depthwise_BN/moving_variance5block_3_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_3_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
z
#block_3_depthwise_BN/ReadVariableOpReadVariableOpblock_3_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
{
%block_3_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_3_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
4block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
6block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
%block_3_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_3_depthwise/depthwise#block_3_depthwise_BN/ReadVariableOp%block_3_depthwise_BN/ReadVariableOp_14block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????0:0:0:0:0:*
epsilon%o?:
_
block_3_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_3_depthwise_relu/Relu6Relu6%block_3_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????0
?
7block_3_project/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      0      *)
_class
loc:@block_3_project/kernel
?
5block_3_project/kernel/Initializer/random_uniform/minConst*
valueB
 *qĜ?*)
_class
loc:@block_3_project/kernel*
dtype0*
_output_shapes
: 
?
5block_3_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *qĜ>*)
_class
loc:@block_3_project/kernel*
dtype0*
_output_shapes
: 
?
?block_3_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_3_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_3_project/kernel*
dtype0*&
_output_shapes
:0
?
5block_3_project/kernel/Initializer/random_uniform/subSub5block_3_project/kernel/Initializer/random_uniform/max5block_3_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_3_project/kernel*
_output_shapes
: 
?
5block_3_project/kernel/Initializer/random_uniform/mulMul?block_3_project/kernel/Initializer/random_uniform/RandomUniform5block_3_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_3_project/kernel*&
_output_shapes
:0
?
1block_3_project/kernel/Initializer/random_uniformAdd5block_3_project/kernel/Initializer/random_uniform/mul5block_3_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_3_project/kernel*&
_output_shapes
:0
?
block_3_project/kernelVarHandleOp*
shape:0*'
shared_nameblock_3_project/kernel*)
_class
loc:@block_3_project/kernel*
dtype0*
_output_shapes
: 
}
7block_3_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_project/kernel*
_output_shapes
: 
?
block_3_project/kernel/AssignAssignVariableOpblock_3_project/kernel1block_3_project/kernel/Initializer/random_uniform*
dtype0
?
*block_3_project/kernel/Read/ReadVariableOpReadVariableOpblock_3_project/kernel*
dtype0*&
_output_shapes
:0
n
block_3_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_3_project/Conv2D/ReadVariableOpReadVariableOpblock_3_project/kernel*
dtype0*&
_output_shapes
:0
?
block_3_project/Conv2DConv2Dblock_3_depthwise_relu/Relu6%block_3_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
?
)block_3_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_3_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_3_project_BN/gammaVarHandleOp*+
_class!
loc:@block_3_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:*)
shared_nameblock_3_project_BN/gamma
?
9block_3_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_project_BN/gamma*
_output_shapes
: 
?
block_3_project_BN/gamma/AssignAssignVariableOpblock_3_project_BN/gamma)block_3_project_BN/gamma/Initializer/ones*
dtype0
?
,block_3_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_3_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_3_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_3_project_BN/beta*
dtype0*
_output_shapes
:
?
block_3_project_BN/betaVarHandleOp*
shape:*(
shared_nameblock_3_project_BN/beta**
_class 
loc:@block_3_project_BN/beta*
dtype0*
_output_shapes
: 

8block_3_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_project_BN/beta*
_output_shapes
: 
?
block_3_project_BN/beta/AssignAssignVariableOpblock_3_project_BN/beta)block_3_project_BN/beta/Initializer/zeros*
dtype0

+block_3_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_3_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_3_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_3_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_3_project_BN/moving_meanVarHandleOp*
shape:*/
shared_name block_3_project_BN/moving_mean*1
_class'
%#loc:@block_3_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
?block_3_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_3_project_BN/moving_mean*
_output_shapes
: 
?
%block_3_project_BN/moving_mean/AssignAssignVariableOpblock_3_project_BN/moving_mean0block_3_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_3_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_3_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_3_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_3_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_3_project_BN/moving_varianceVarHandleOp*
shape:*3
shared_name$"block_3_project_BN/moving_variance*5
_class+
)'loc:@block_3_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_3_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_3_project_BN/moving_variance*
_output_shapes
: 
?
)block_3_project_BN/moving_variance/AssignAssignVariableOp"block_3_project_BN/moving_variance3block_3_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_3_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_3_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_3_project_BN/ReadVariableOpReadVariableOpblock_3_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_3_project_BN/ReadVariableOp_1ReadVariableOpblock_3_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_3_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_3_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_3_project_BN/FusedBatchNormV3FusedBatchNormV3block_3_project/Conv2D!block_3_project_BN/ReadVariableOp#block_3_project_BN/ReadVariableOp_12block_3_project_BN/FusedBatchNormV3/ReadVariableOp4block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
]
block_3_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
6block_4_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         `   *(
_class
loc:@block_4_expand/kernel
?
4block_4_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *?m?*(
_class
loc:@block_4_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_4_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?m>*(
_class
loc:@block_4_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_4_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_4_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_4_expand/kernel*
dtype0*&
_output_shapes
:`
?
4block_4_expand/kernel/Initializer/random_uniform/subSub4block_4_expand/kernel/Initializer/random_uniform/max4block_4_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_4_expand/kernel*
_output_shapes
: 
?
4block_4_expand/kernel/Initializer/random_uniform/mulMul>block_4_expand/kernel/Initializer/random_uniform/RandomUniform4block_4_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_4_expand/kernel*&
_output_shapes
:`
?
0block_4_expand/kernel/Initializer/random_uniformAdd4block_4_expand/kernel/Initializer/random_uniform/mul4block_4_expand/kernel/Initializer/random_uniform/min*&
_output_shapes
:`*
T0*(
_class
loc:@block_4_expand/kernel
?
block_4_expand/kernelVarHandleOp*(
_class
loc:@block_4_expand/kernel*
dtype0*
_output_shapes
: *
shape:`*&
shared_nameblock_4_expand/kernel
{
6block_4_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_expand/kernel*
_output_shapes
: 
?
block_4_expand/kernel/AssignAssignVariableOpblock_4_expand/kernel0block_4_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_4_expand/kernel/Read/ReadVariableOpReadVariableOpblock_4_expand/kernel*
dtype0*&
_output_shapes
:`
m
block_4_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
$block_4_expand/Conv2D/ReadVariableOpReadVariableOpblock_4_expand/kernel*
dtype0*&
_output_shapes
:`
?
block_4_expand/Conv2DConv2D#block_3_project_BN/FusedBatchNormV3$block_4_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
(block_4_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:`*
valueB`*  ??**
_class 
loc:@block_4_expand_BN/gamma
?
block_4_expand_BN/gammaVarHandleOp**
_class 
loc:@block_4_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:`*(
shared_nameblock_4_expand_BN/gamma

8block_4_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_expand_BN/gamma*
_output_shapes
: 
?
block_4_expand_BN/gamma/AssignAssignVariableOpblock_4_expand_BN/gamma(block_4_expand_BN/gamma/Initializer/ones*
dtype0

+block_4_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_4_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
(block_4_expand_BN/beta/Initializer/zerosConst*
valueB`*    *)
_class
loc:@block_4_expand_BN/beta*
dtype0*
_output_shapes
:`
?
block_4_expand_BN/betaVarHandleOp*)
_class
loc:@block_4_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:`*'
shared_nameblock_4_expand_BN/beta
}
7block_4_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_expand_BN/beta*
_output_shapes
: 
?
block_4_expand_BN/beta/AssignAssignVariableOpblock_4_expand_BN/beta(block_4_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_4_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_4_expand_BN/beta*
dtype0*
_output_shapes
:`
?
/block_4_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:`*
valueB`*    *0
_class&
$"loc:@block_4_expand_BN/moving_mean
?
block_4_expand_BN/moving_meanVarHandleOp*
shape:`*.
shared_nameblock_4_expand_BN/moving_mean*0
_class&
$"loc:@block_4_expand_BN/moving_mean*
dtype0*
_output_shapes
: 
?
>block_4_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_expand_BN/moving_mean*
_output_shapes
: 
?
$block_4_expand_BN/moving_mean/AssignAssignVariableOpblock_4_expand_BN/moving_mean/block_4_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_4_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_4_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
2block_4_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:`*
valueB`*  ??*4
_class*
(&loc:@block_4_expand_BN/moving_variance
?
!block_4_expand_BN/moving_varianceVarHandleOp*4
_class*
(&loc:@block_4_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:`*2
shared_name#!block_4_expand_BN/moving_variance
?
Bblock_4_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_4_expand_BN/moving_variance*
_output_shapes
: 
?
(block_4_expand_BN/moving_variance/AssignAssignVariableOp!block_4_expand_BN/moving_variance2block_4_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_4_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_4_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
t
 block_4_expand_BN/ReadVariableOpReadVariableOpblock_4_expand_BN/gamma*
dtype0*
_output_shapes
:`
u
"block_4_expand_BN/ReadVariableOp_1ReadVariableOpblock_4_expand_BN/beta*
dtype0*
_output_shapes
:`
?
1block_4_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
3block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_4_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
"block_4_expand_BN/FusedBatchNormV3FusedBatchNormV3block_4_expand/Conv2D block_4_expand_BN/ReadVariableOp"block_4_expand_BN/ReadVariableOp_11block_4_expand_BN/FusedBatchNormV3/ReadVariableOp3block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:*
T0*
U0
\
block_4_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_4_expand_relu/Relu6Relu6"block_4_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
Cblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      `      *5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_4_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *?ȩ?*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_4_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *?ȩ=*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
Ablock_4_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel
?
Ablock_4_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*&
_output_shapes
:`
?
=block_4_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_4_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*&
_output_shapes
:`
?
"block_4_depthwise/depthwise_kernelVarHandleOp*
shape:`*3
shared_name$"block_4_depthwise/depthwise_kernel*5
_class+
)'loc:@block_4_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Cblock_4_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_4_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_4_depthwise/depthwise_kernel/AssignAssignVariableOp"block_4_depthwise/depthwise_kernel=block_4_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_4_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_4_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
*block_4_depthwise/depthwise/ReadVariableOpReadVariableOp"block_4_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
z
!block_4_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
z
)block_4_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_4_depthwise/depthwiseDepthwiseConv2dNativeblock_4_expand_relu/Relu6*block_4_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
+block_4_depthwise_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:`*
valueB`*  ??*-
_class#
!loc:@block_4_depthwise_BN/gamma
?
block_4_depthwise_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*+
shared_nameblock_4_depthwise_BN/gamma*-
_class#
!loc:@block_4_depthwise_BN/gamma
?
;block_4_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_depthwise_BN/gamma*
_output_shapes
: 
?
!block_4_depthwise_BN/gamma/AssignAssignVariableOpblock_4_depthwise_BN/gamma+block_4_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_4_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_4_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
+block_4_depthwise_BN/beta/Initializer/zerosConst*
valueB`*    *,
_class"
 loc:@block_4_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
block_4_depthwise_BN/betaVarHandleOp*
shape:`**
shared_nameblock_4_depthwise_BN/beta*,
_class"
 loc:@block_4_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
:block_4_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_depthwise_BN/beta*
_output_shapes
: 
?
 block_4_depthwise_BN/beta/AssignAssignVariableOpblock_4_depthwise_BN/beta+block_4_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_4_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_4_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
2block_4_depthwise_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:`*
valueB`*    *3
_class)
'%loc:@block_4_depthwise_BN/moving_mean
?
 block_4_depthwise_BN/moving_meanVarHandleOp*3
_class)
'%loc:@block_4_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:`*1
shared_name" block_4_depthwise_BN/moving_mean
?
Ablock_4_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_4_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_4_depthwise_BN/moving_mean/AssignAssignVariableOp block_4_depthwise_BN/moving_mean2block_4_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_4_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_4_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
5block_4_depthwise_BN/moving_variance/Initializer/onesConst*
valueB`*  ??*7
_class-
+)loc:@block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
$block_4_depthwise_BN/moving_varianceVarHandleOp*
shape:`*5
shared_name&$block_4_depthwise_BN/moving_variance*7
_class-
+)loc:@block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Eblock_4_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_4_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_4_depthwise_BN/moving_variance/AssignAssignVariableOp$block_4_depthwise_BN/moving_variance5block_4_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_4_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
z
#block_4_depthwise_BN/ReadVariableOpReadVariableOpblock_4_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
{
%block_4_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_4_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
4block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_4_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
6block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
%block_4_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_4_depthwise/depthwise#block_4_depthwise_BN/ReadVariableOp%block_4_depthwise_BN/ReadVariableOp_14block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:*
T0*
U0
_
block_4_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_4_depthwise_relu/Relu6Relu6%block_4_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????`*
T0
?
7block_4_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      `      *)
_class
loc:@block_4_project/kernel*
dtype0*
_output_shapes
:
?
5block_4_project/kernel/Initializer/random_uniform/minConst*
valueB
 *?m?*)
_class
loc:@block_4_project/kernel*
dtype0*
_output_shapes
: 
?
5block_4_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?m>*)
_class
loc:@block_4_project/kernel*
dtype0*
_output_shapes
: 
?
?block_4_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_4_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_4_project/kernel*
dtype0*&
_output_shapes
:`
?
5block_4_project/kernel/Initializer/random_uniform/subSub5block_4_project/kernel/Initializer/random_uniform/max5block_4_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_4_project/kernel
?
5block_4_project/kernel/Initializer/random_uniform/mulMul?block_4_project/kernel/Initializer/random_uniform/RandomUniform5block_4_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_4_project/kernel*&
_output_shapes
:`
?
1block_4_project/kernel/Initializer/random_uniformAdd5block_4_project/kernel/Initializer/random_uniform/mul5block_4_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_4_project/kernel*&
_output_shapes
:`
?
block_4_project/kernelVarHandleOp*
shape:`*'
shared_nameblock_4_project/kernel*)
_class
loc:@block_4_project/kernel*
dtype0*
_output_shapes
: 
}
7block_4_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_project/kernel*
_output_shapes
: 
?
block_4_project/kernel/AssignAssignVariableOpblock_4_project/kernel1block_4_project/kernel/Initializer/random_uniform*
dtype0
?
*block_4_project/kernel/Read/ReadVariableOpReadVariableOpblock_4_project/kernel*
dtype0*&
_output_shapes
:`
n
block_4_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_4_project/Conv2D/ReadVariableOpReadVariableOpblock_4_project/kernel*
dtype0*&
_output_shapes
:`
?
block_4_project/Conv2DConv2Dblock_4_depthwise_relu/Relu6%block_4_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
?
)block_4_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*+
_class!
loc:@block_4_project_BN/gamma
?
block_4_project_BN/gammaVarHandleOp*
shape:*)
shared_nameblock_4_project_BN/gamma*+
_class!
loc:@block_4_project_BN/gamma*
dtype0*
_output_shapes
: 
?
9block_4_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_project_BN/gamma*
_output_shapes
: 
?
block_4_project_BN/gamma/AssignAssignVariableOpblock_4_project_BN/gamma)block_4_project_BN/gamma/Initializer/ones*
dtype0
?
,block_4_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_4_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_4_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_4_project_BN/beta*
dtype0*
_output_shapes
:
?
block_4_project_BN/betaVarHandleOp*(
shared_nameblock_4_project_BN/beta**
_class 
loc:@block_4_project_BN/beta*
dtype0*
_output_shapes
: *
shape:

8block_4_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_project_BN/beta*
_output_shapes
: 
?
block_4_project_BN/beta/AssignAssignVariableOpblock_4_project_BN/beta)block_4_project_BN/beta/Initializer/zeros*
dtype0

+block_4_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_4_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_4_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_4_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_4_project_BN/moving_meanVarHandleOp*/
shared_name block_4_project_BN/moving_mean*1
_class'
%#loc:@block_4_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:
?
?block_4_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_4_project_BN/moving_mean*
_output_shapes
: 
?
%block_4_project_BN/moving_mean/AssignAssignVariableOpblock_4_project_BN/moving_mean0block_4_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_4_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_4_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_4_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_4_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_4_project_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_4_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:*3
shared_name$"block_4_project_BN/moving_variance
?
Cblock_4_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_4_project_BN/moving_variance*
_output_shapes
: 
?
)block_4_project_BN/moving_variance/AssignAssignVariableOp"block_4_project_BN/moving_variance3block_4_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_4_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_4_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_4_project_BN/ReadVariableOpReadVariableOpblock_4_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_4_project_BN/ReadVariableOp_1ReadVariableOpblock_4_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_4_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_4_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_4_project_BN/FusedBatchNormV3FusedBatchNormV3block_4_project/Conv2D!block_4_project_BN/ReadVariableOp#block_4_project_BN/ReadVariableOp_12block_4_project_BN/FusedBatchNormV3/ReadVariableOp4block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:
]
block_4_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_4_add/addAddV2#block_3_project_BN/FusedBatchNormV3#block_4_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
6block_5_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         `   *(
_class
loc:@block_5_expand/kernel
?
4block_5_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *?m?*(
_class
loc:@block_5_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_5_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?m>*(
_class
loc:@block_5_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_5_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_5_expand/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:`*
T0*(
_class
loc:@block_5_expand/kernel
?
4block_5_expand/kernel/Initializer/random_uniform/subSub4block_5_expand/kernel/Initializer/random_uniform/max4block_5_expand/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*(
_class
loc:@block_5_expand/kernel
?
4block_5_expand/kernel/Initializer/random_uniform/mulMul>block_5_expand/kernel/Initializer/random_uniform/RandomUniform4block_5_expand/kernel/Initializer/random_uniform/sub*&
_output_shapes
:`*
T0*(
_class
loc:@block_5_expand/kernel
?
0block_5_expand/kernel/Initializer/random_uniformAdd4block_5_expand/kernel/Initializer/random_uniform/mul4block_5_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_5_expand/kernel*&
_output_shapes
:`
?
block_5_expand/kernelVarHandleOp*(
_class
loc:@block_5_expand/kernel*
dtype0*
_output_shapes
: *
shape:`*&
shared_nameblock_5_expand/kernel
{
6block_5_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_expand/kernel*
_output_shapes
: 
?
block_5_expand/kernel/AssignAssignVariableOpblock_5_expand/kernel0block_5_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_5_expand/kernel/Read/ReadVariableOpReadVariableOpblock_5_expand/kernel*
dtype0*&
_output_shapes
:`
m
block_5_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
$block_5_expand/Conv2D/ReadVariableOpReadVariableOpblock_5_expand/kernel*
dtype0*&
_output_shapes
:`
?
block_5_expand/Conv2DConv2Dblock_4_add/add$block_5_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
?
(block_5_expand_BN/gamma/Initializer/onesConst*
valueB`*  ??**
_class 
loc:@block_5_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
block_5_expand_BN/gammaVarHandleOp*(
shared_nameblock_5_expand_BN/gamma**
_class 
loc:@block_5_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:`

8block_5_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_expand_BN/gamma*
_output_shapes
: 
?
block_5_expand_BN/gamma/AssignAssignVariableOpblock_5_expand_BN/gamma(block_5_expand_BN/gamma/Initializer/ones*
dtype0

+block_5_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_5_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
(block_5_expand_BN/beta/Initializer/zerosConst*
valueB`*    *)
_class
loc:@block_5_expand_BN/beta*
dtype0*
_output_shapes
:`
?
block_5_expand_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*'
shared_nameblock_5_expand_BN/beta*)
_class
loc:@block_5_expand_BN/beta
}
7block_5_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_expand_BN/beta*
_output_shapes
: 
?
block_5_expand_BN/beta/AssignAssignVariableOpblock_5_expand_BN/beta(block_5_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_5_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_5_expand_BN/beta*
dtype0*
_output_shapes
:`
?
/block_5_expand_BN/moving_mean/Initializer/zerosConst*
valueB`*    *0
_class&
$"loc:@block_5_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
block_5_expand_BN/moving_meanVarHandleOp*
shape:`*.
shared_nameblock_5_expand_BN/moving_mean*0
_class&
$"loc:@block_5_expand_BN/moving_mean*
dtype0*
_output_shapes
: 
?
>block_5_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_expand_BN/moving_mean*
_output_shapes
: 
?
$block_5_expand_BN/moving_mean/AssignAssignVariableOpblock_5_expand_BN/moving_mean/block_5_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_5_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_5_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
2block_5_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:`*
valueB`*  ??*4
_class*
(&loc:@block_5_expand_BN/moving_variance
?
!block_5_expand_BN/moving_varianceVarHandleOp*
shape:`*2
shared_name#!block_5_expand_BN/moving_variance*4
_class*
(&loc:@block_5_expand_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Bblock_5_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_5_expand_BN/moving_variance*
_output_shapes
: 
?
(block_5_expand_BN/moving_variance/AssignAssignVariableOp!block_5_expand_BN/moving_variance2block_5_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_5_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_5_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
t
 block_5_expand_BN/ReadVariableOpReadVariableOpblock_5_expand_BN/gamma*
dtype0*
_output_shapes
:`
u
"block_5_expand_BN/ReadVariableOp_1ReadVariableOpblock_5_expand_BN/beta*
dtype0*
_output_shapes
:`
?
1block_5_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
3block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_5_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
"block_5_expand_BN/FusedBatchNormV3FusedBatchNormV3block_5_expand/Conv2D block_5_expand_BN/ReadVariableOp"block_5_expand_BN/ReadVariableOp_11block_5_expand_BN/FusedBatchNormV3/ReadVariableOp3block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( *
epsilon%o?:
\
block_5_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_5_expand_relu/Relu6Relu6"block_5_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
Cblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      `      *5
_class+
)'loc:@block_5_depthwise/depthwise_kernel
?
Ablock_5_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *?ȩ?*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_5_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *?ȩ=*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:`*
T0*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel
?
Ablock_5_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_5_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*&
_output_shapes
:`
?
=block_5_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_5_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*&
_output_shapes
:`
?
"block_5_depthwise/depthwise_kernelVarHandleOp*3
shared_name$"block_5_depthwise/depthwise_kernel*5
_class+
)'loc:@block_5_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: *
shape:`
?
Cblock_5_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_5_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_5_depthwise/depthwise_kernel/AssignAssignVariableOp"block_5_depthwise/depthwise_kernel=block_5_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_5_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_5_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
*block_5_depthwise/depthwise/ReadVariableOpReadVariableOp"block_5_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
z
!block_5_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
z
)block_5_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
block_5_depthwise/depthwiseDepthwiseConv2dNativeblock_5_expand_relu/Relu6*block_5_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
+block_5_depthwise_BN/gamma/Initializer/onesConst*
valueB`*  ??*-
_class#
!loc:@block_5_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
block_5_depthwise_BN/gammaVarHandleOp*-
_class#
!loc:@block_5_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:`*+
shared_nameblock_5_depthwise_BN/gamma
?
;block_5_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_depthwise_BN/gamma*
_output_shapes
: 
?
!block_5_depthwise_BN/gamma/AssignAssignVariableOpblock_5_depthwise_BN/gamma+block_5_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_5_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_5_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
+block_5_depthwise_BN/beta/Initializer/zerosConst*
valueB`*    *,
_class"
 loc:@block_5_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
block_5_depthwise_BN/betaVarHandleOp*
shape:`**
shared_nameblock_5_depthwise_BN/beta*,
_class"
 loc:@block_5_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
:block_5_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_depthwise_BN/beta*
_output_shapes
: 
?
 block_5_depthwise_BN/beta/AssignAssignVariableOpblock_5_depthwise_BN/beta+block_5_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_5_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_5_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
2block_5_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB`*    *3
_class)
'%loc:@block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
 block_5_depthwise_BN/moving_meanVarHandleOp*1
shared_name" block_5_depthwise_BN/moving_mean*3
_class)
'%loc:@block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:`
?
Ablock_5_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_5_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_5_depthwise_BN/moving_mean/AssignAssignVariableOp block_5_depthwise_BN/moving_mean2block_5_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_5_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
5block_5_depthwise_BN/moving_variance/Initializer/onesConst*
valueB`*  ??*7
_class-
+)loc:@block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
$block_5_depthwise_BN/moving_varianceVarHandleOp*7
_class-
+)loc:@block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:`*5
shared_name&$block_5_depthwise_BN/moving_variance
?
Eblock_5_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_5_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_5_depthwise_BN/moving_variance/AssignAssignVariableOp$block_5_depthwise_BN/moving_variance5block_5_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_5_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
z
#block_5_depthwise_BN/ReadVariableOpReadVariableOpblock_5_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
{
%block_5_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_5_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
4block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
6block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
%block_5_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_5_depthwise/depthwise#block_5_depthwise_BN/ReadVariableOp%block_5_depthwise_BN/ReadVariableOp_14block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( 
_
block_5_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_5_depthwise_relu/Relu6Relu6%block_5_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
7block_5_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      `      *)
_class
loc:@block_5_project/kernel*
dtype0*
_output_shapes
:
?
5block_5_project/kernel/Initializer/random_uniform/minConst*
valueB
 *?m?*)
_class
loc:@block_5_project/kernel*
dtype0*
_output_shapes
: 
?
5block_5_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?m>*)
_class
loc:@block_5_project/kernel*
dtype0*
_output_shapes
: 
?
?block_5_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_5_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_5_project/kernel*
dtype0*&
_output_shapes
:`
?
5block_5_project/kernel/Initializer/random_uniform/subSub5block_5_project/kernel/Initializer/random_uniform/max5block_5_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_5_project/kernel
?
5block_5_project/kernel/Initializer/random_uniform/mulMul?block_5_project/kernel/Initializer/random_uniform/RandomUniform5block_5_project/kernel/Initializer/random_uniform/sub*&
_output_shapes
:`*
T0*)
_class
loc:@block_5_project/kernel
?
1block_5_project/kernel/Initializer/random_uniformAdd5block_5_project/kernel/Initializer/random_uniform/mul5block_5_project/kernel/Initializer/random_uniform/min*&
_output_shapes
:`*
T0*)
_class
loc:@block_5_project/kernel
?
block_5_project/kernelVarHandleOp*)
_class
loc:@block_5_project/kernel*
dtype0*
_output_shapes
: *
shape:`*'
shared_nameblock_5_project/kernel
}
7block_5_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_project/kernel*
_output_shapes
: 
?
block_5_project/kernel/AssignAssignVariableOpblock_5_project/kernel1block_5_project/kernel/Initializer/random_uniform*
dtype0
?
*block_5_project/kernel/Read/ReadVariableOpReadVariableOpblock_5_project/kernel*
dtype0*&
_output_shapes
:`
n
block_5_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_5_project/Conv2D/ReadVariableOpReadVariableOpblock_5_project/kernel*
dtype0*&
_output_shapes
:`
?
block_5_project/Conv2DConv2Dblock_5_depthwise_relu/Relu6%block_5_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
?
)block_5_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_5_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_5_project_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:*)
shared_nameblock_5_project_BN/gamma*+
_class!
loc:@block_5_project_BN/gamma
?
9block_5_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_project_BN/gamma*
_output_shapes
: 
?
block_5_project_BN/gamma/AssignAssignVariableOpblock_5_project_BN/gamma)block_5_project_BN/gamma/Initializer/ones*
dtype0
?
,block_5_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_5_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_5_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_5_project_BN/beta*
dtype0*
_output_shapes
:
?
block_5_project_BN/betaVarHandleOp*(
shared_nameblock_5_project_BN/beta**
_class 
loc:@block_5_project_BN/beta*
dtype0*
_output_shapes
: *
shape:

8block_5_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_project_BN/beta*
_output_shapes
: 
?
block_5_project_BN/beta/AssignAssignVariableOpblock_5_project_BN/beta)block_5_project_BN/beta/Initializer/zeros*
dtype0

+block_5_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_5_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_5_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_5_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_5_project_BN/moving_meanVarHandleOp*1
_class'
%#loc:@block_5_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:*/
shared_name block_5_project_BN/moving_mean
?
?block_5_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_5_project_BN/moving_mean*
_output_shapes
: 
?
%block_5_project_BN/moving_mean/AssignAssignVariableOpblock_5_project_BN/moving_mean0block_5_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_5_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_5_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_5_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_5_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_5_project_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_5_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:*3
shared_name$"block_5_project_BN/moving_variance
?
Cblock_5_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_5_project_BN/moving_variance*
_output_shapes
: 
?
)block_5_project_BN/moving_variance/AssignAssignVariableOp"block_5_project_BN/moving_variance3block_5_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_5_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_5_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_5_project_BN/ReadVariableOpReadVariableOpblock_5_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_5_project_BN/ReadVariableOp_1ReadVariableOpblock_5_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_5_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_5_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_5_project_BN/FusedBatchNormV3FusedBatchNormV3block_5_project/Conv2D!block_5_project_BN/ReadVariableOp#block_5_project_BN/ReadVariableOp_12block_5_project_BN/FusedBatchNormV3/ReadVariableOp4block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
]
block_5_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_5_add/addAddV2block_4_add/add#block_5_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
6block_6_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         `   *(
_class
loc:@block_6_expand/kernel
?
4block_6_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *?m?*(
_class
loc:@block_6_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_6_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?m>*(
_class
loc:@block_6_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_6_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_6_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_6_expand/kernel*
dtype0*&
_output_shapes
:`
?
4block_6_expand/kernel/Initializer/random_uniform/subSub4block_6_expand/kernel/Initializer/random_uniform/max4block_6_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_6_expand/kernel*
_output_shapes
: 
?
4block_6_expand/kernel/Initializer/random_uniform/mulMul>block_6_expand/kernel/Initializer/random_uniform/RandomUniform4block_6_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_6_expand/kernel*&
_output_shapes
:`
?
0block_6_expand/kernel/Initializer/random_uniformAdd4block_6_expand/kernel/Initializer/random_uniform/mul4block_6_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_6_expand/kernel*&
_output_shapes
:`
?
block_6_expand/kernelVarHandleOp*(
_class
loc:@block_6_expand/kernel*
dtype0*
_output_shapes
: *
shape:`*&
shared_nameblock_6_expand/kernel
{
6block_6_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_expand/kernel*
_output_shapes
: 
?
block_6_expand/kernel/AssignAssignVariableOpblock_6_expand/kernel0block_6_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_6_expand/kernel/Read/ReadVariableOpReadVariableOpblock_6_expand/kernel*
dtype0*&
_output_shapes
:`
m
block_6_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_6_expand/Conv2D/ReadVariableOpReadVariableOpblock_6_expand/kernel*
dtype0*&
_output_shapes
:`
?
block_6_expand/Conv2DConv2Dblock_5_add/add$block_6_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
?
(block_6_expand_BN/gamma/Initializer/onesConst*
valueB`*  ??**
_class 
loc:@block_6_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
block_6_expand_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*(
shared_nameblock_6_expand_BN/gamma**
_class 
loc:@block_6_expand_BN/gamma

8block_6_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_expand_BN/gamma*
_output_shapes
: 
?
block_6_expand_BN/gamma/AssignAssignVariableOpblock_6_expand_BN/gamma(block_6_expand_BN/gamma/Initializer/ones*
dtype0

+block_6_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_6_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
(block_6_expand_BN/beta/Initializer/zerosConst*
valueB`*    *)
_class
loc:@block_6_expand_BN/beta*
dtype0*
_output_shapes
:`
?
block_6_expand_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*'
shared_nameblock_6_expand_BN/beta*)
_class
loc:@block_6_expand_BN/beta
}
7block_6_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_expand_BN/beta*
_output_shapes
: 
?
block_6_expand_BN/beta/AssignAssignVariableOpblock_6_expand_BN/beta(block_6_expand_BN/beta/Initializer/zeros*
dtype0
}
*block_6_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_6_expand_BN/beta*
dtype0*
_output_shapes
:`
?
/block_6_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:`*
valueB`*    *0
_class&
$"loc:@block_6_expand_BN/moving_mean
?
block_6_expand_BN/moving_meanVarHandleOp*.
shared_nameblock_6_expand_BN/moving_mean*0
_class&
$"loc:@block_6_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:`
?
>block_6_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_expand_BN/moving_mean*
_output_shapes
: 
?
$block_6_expand_BN/moving_mean/AssignAssignVariableOpblock_6_expand_BN/moving_mean/block_6_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_6_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_6_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
2block_6_expand_BN/moving_variance/Initializer/onesConst*
valueB`*  ??*4
_class*
(&loc:@block_6_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
!block_6_expand_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*2
shared_name#!block_6_expand_BN/moving_variance*4
_class*
(&loc:@block_6_expand_BN/moving_variance
?
Bblock_6_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_6_expand_BN/moving_variance*
_output_shapes
: 
?
(block_6_expand_BN/moving_variance/AssignAssignVariableOp!block_6_expand_BN/moving_variance2block_6_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_6_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_6_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
t
 block_6_expand_BN/ReadVariableOpReadVariableOpblock_6_expand_BN/gamma*
dtype0*
_output_shapes
:`
u
"block_6_expand_BN/ReadVariableOp_1ReadVariableOpblock_6_expand_BN/beta*
dtype0*
_output_shapes
:`
?
1block_6_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
3block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_6_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
"block_6_expand_BN/FusedBatchNormV3FusedBatchNormV3block_6_expand/Conv2D block_6_expand_BN/ReadVariableOp"block_6_expand_BN/ReadVariableOp_11block_6_expand_BN/FusedBatchNormV3/ReadVariableOp3block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:
\
block_6_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_6_expand_relu/Relu6Relu6"block_6_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
block_6_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
block_6_pad/PadPadblock_6_expand_relu/Relu6block_6_pad/Pad/paddings*
T0*/
_output_shapes
:?????????`
?
Cblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      `      *5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_6_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *?ȩ?*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_6_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *?ȩ=*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
Ablock_6_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_6_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*&
_output_shapes
:`
?
=block_6_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_6_depthwise/depthwise_kernel/Initializer/random_uniform/min*&
_output_shapes
:`*
T0*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel
?
"block_6_depthwise/depthwise_kernelVarHandleOp*
shape:`*3
shared_name$"block_6_depthwise/depthwise_kernel*5
_class+
)'loc:@block_6_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Cblock_6_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_6_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_6_depthwise/depthwise_kernel/AssignAssignVariableOp"block_6_depthwise/depthwise_kernel=block_6_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_6_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_6_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
*block_6_depthwise/depthwise/ReadVariableOpReadVariableOp"block_6_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
z
!block_6_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      `      
z
)block_6_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_6_depthwise/depthwiseDepthwiseConv2dNativeblock_6_pad/Pad*block_6_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????`
?
+block_6_depthwise_BN/gamma/Initializer/onesConst*
valueB`*  ??*-
_class#
!loc:@block_6_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
block_6_depthwise_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:`*+
shared_nameblock_6_depthwise_BN/gamma*-
_class#
!loc:@block_6_depthwise_BN/gamma
?
;block_6_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_depthwise_BN/gamma*
_output_shapes
: 
?
!block_6_depthwise_BN/gamma/AssignAssignVariableOpblock_6_depthwise_BN/gamma+block_6_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_6_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_6_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
+block_6_depthwise_BN/beta/Initializer/zerosConst*
valueB`*    *,
_class"
 loc:@block_6_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
block_6_depthwise_BN/betaVarHandleOp*,
_class"
 loc:@block_6_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:`**
shared_nameblock_6_depthwise_BN/beta
?
:block_6_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_depthwise_BN/beta*
_output_shapes
: 
?
 block_6_depthwise_BN/beta/AssignAssignVariableOpblock_6_depthwise_BN/beta+block_6_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_6_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_6_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
2block_6_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB`*    *3
_class)
'%loc:@block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
 block_6_depthwise_BN/moving_meanVarHandleOp*1
shared_name" block_6_depthwise_BN/moving_mean*3
_class)
'%loc:@block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:`
?
Ablock_6_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_6_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_6_depthwise_BN/moving_mean/AssignAssignVariableOp block_6_depthwise_BN/moving_mean2block_6_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_6_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
5block_6_depthwise_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:`*
valueB`*  ??*7
_class-
+)loc:@block_6_depthwise_BN/moving_variance
?
$block_6_depthwise_BN/moving_varianceVarHandleOp*
shape:`*5
shared_name&$block_6_depthwise_BN/moving_variance*7
_class-
+)loc:@block_6_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Eblock_6_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_6_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_6_depthwise_BN/moving_variance/AssignAssignVariableOp$block_6_depthwise_BN/moving_variance5block_6_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_6_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_6_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
z
#block_6_depthwise_BN/ReadVariableOpReadVariableOpblock_6_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
{
%block_6_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_6_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
4block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
6block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_6_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
%block_6_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_6_depthwise/depthwise#block_6_depthwise_BN/ReadVariableOp%block_6_depthwise_BN/ReadVariableOp_14block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( *
epsilon%o?:*
T0*
U0
_
block_6_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_6_depthwise_relu/Relu6Relu6%block_6_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
7block_6_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      `      *)
_class
loc:@block_6_project/kernel*
dtype0*
_output_shapes
:
?
5block_6_project/kernel/Initializer/random_uniform/minConst*
valueB
 *.?d?*)
_class
loc:@block_6_project/kernel*
dtype0*
_output_shapes
: 
?
5block_6_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *.?d>*)
_class
loc:@block_6_project/kernel*
dtype0*
_output_shapes
: 
?
?block_6_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_6_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_6_project/kernel*
dtype0*&
_output_shapes
:`
?
5block_6_project/kernel/Initializer/random_uniform/subSub5block_6_project/kernel/Initializer/random_uniform/max5block_6_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_6_project/kernel*
_output_shapes
: 
?
5block_6_project/kernel/Initializer/random_uniform/mulMul?block_6_project/kernel/Initializer/random_uniform/RandomUniform5block_6_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_6_project/kernel*&
_output_shapes
:`
?
1block_6_project/kernel/Initializer/random_uniformAdd5block_6_project/kernel/Initializer/random_uniform/mul5block_6_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_6_project/kernel*&
_output_shapes
:`
?
block_6_project/kernelVarHandleOp*
shape:`*'
shared_nameblock_6_project/kernel*)
_class
loc:@block_6_project/kernel*
dtype0*
_output_shapes
: 
}
7block_6_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_project/kernel*
_output_shapes
: 
?
block_6_project/kernel/AssignAssignVariableOpblock_6_project/kernel1block_6_project/kernel/Initializer/random_uniform*
dtype0
?
*block_6_project/kernel/Read/ReadVariableOpReadVariableOpblock_6_project/kernel*
dtype0*&
_output_shapes
:`
n
block_6_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_6_project/Conv2D/ReadVariableOpReadVariableOpblock_6_project/kernel*
dtype0*&
_output_shapes
:`
?
block_6_project/Conv2DConv2Dblock_6_depthwise_relu/Relu6%block_6_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
)block_6_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_6_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_6_project_BN/gammaVarHandleOp*)
shared_nameblock_6_project_BN/gamma*+
_class!
loc:@block_6_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:
?
9block_6_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_project_BN/gamma*
_output_shapes
: 
?
block_6_project_BN/gamma/AssignAssignVariableOpblock_6_project_BN/gamma)block_6_project_BN/gamma/Initializer/ones*
dtype0
?
,block_6_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_6_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_6_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    **
_class 
loc:@block_6_project_BN/beta
?
block_6_project_BN/betaVarHandleOp*
shape:*(
shared_nameblock_6_project_BN/beta**
_class 
loc:@block_6_project_BN/beta*
dtype0*
_output_shapes
: 

8block_6_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_project_BN/beta*
_output_shapes
: 
?
block_6_project_BN/beta/AssignAssignVariableOpblock_6_project_BN/beta)block_6_project_BN/beta/Initializer/zeros*
dtype0

+block_6_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_6_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_6_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_6_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_6_project_BN/moving_meanVarHandleOp*/
shared_name block_6_project_BN/moving_mean*1
_class'
%#loc:@block_6_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:
?
?block_6_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_6_project_BN/moving_mean*
_output_shapes
: 
?
%block_6_project_BN/moving_mean/AssignAssignVariableOpblock_6_project_BN/moving_mean0block_6_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_6_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_6_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_6_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_6_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_6_project_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:*3
shared_name$"block_6_project_BN/moving_variance*5
_class+
)'loc:@block_6_project_BN/moving_variance
?
Cblock_6_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_6_project_BN/moving_variance*
_output_shapes
: 
?
)block_6_project_BN/moving_variance/AssignAssignVariableOp"block_6_project_BN/moving_variance3block_6_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_6_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_6_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_6_project_BN/ReadVariableOpReadVariableOpblock_6_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_6_project_BN/ReadVariableOp_1ReadVariableOpblock_6_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_6_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_6_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_6_project_BN/FusedBatchNormV3FusedBatchNormV3block_6_project/Conv2D!block_6_project_BN/ReadVariableOp#block_6_project_BN/ReadVariableOp_12block_6_project_BN/FusedBatchNormV3/ReadVariableOp4block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????:::::*
is_training( 
]
block_6_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
6block_7_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         ?   *(
_class
loc:@block_7_expand/kernel
?
4block_7_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *??A?*(
_class
loc:@block_7_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_7_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*(
_class
loc:@block_7_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_7_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_7_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_7_expand/kernel*
dtype0*'
_output_shapes
:?
?
4block_7_expand/kernel/Initializer/random_uniform/subSub4block_7_expand/kernel/Initializer/random_uniform/max4block_7_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_7_expand/kernel*
_output_shapes
: 
?
4block_7_expand/kernel/Initializer/random_uniform/mulMul>block_7_expand/kernel/Initializer/random_uniform/RandomUniform4block_7_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_7_expand/kernel*'
_output_shapes
:?
?
0block_7_expand/kernel/Initializer/random_uniformAdd4block_7_expand/kernel/Initializer/random_uniform/mul4block_7_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_7_expand/kernel*'
_output_shapes
:?
?
block_7_expand/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*&
shared_nameblock_7_expand/kernel*(
_class
loc:@block_7_expand/kernel
{
6block_7_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_expand/kernel*
_output_shapes
: 
?
block_7_expand/kernel/AssignAssignVariableOpblock_7_expand/kernel0block_7_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_7_expand/kernel/Read/ReadVariableOpReadVariableOpblock_7_expand/kernel*
dtype0*'
_output_shapes
:?
m
block_7_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_7_expand/Conv2D/ReadVariableOpReadVariableOpblock_7_expand/kernel*
dtype0*'
_output_shapes
:?
?
block_7_expand/Conv2DConv2D#block_6_project_BN/FusedBatchNormV3$block_7_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
(block_7_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??**
_class 
loc:@block_7_expand_BN/gamma
?
block_7_expand_BN/gammaVarHandleOp**
_class 
loc:@block_7_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:?*(
shared_nameblock_7_expand_BN/gamma

8block_7_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_expand_BN/gamma*
_output_shapes
: 
?
block_7_expand_BN/gamma/AssignAssignVariableOpblock_7_expand_BN/gamma(block_7_expand_BN/gamma/Initializer/ones*
dtype0
?
+block_7_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_7_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
(block_7_expand_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *)
_class
loc:@block_7_expand_BN/beta
?
block_7_expand_BN/betaVarHandleOp*'
shared_nameblock_7_expand_BN/beta*)
_class
loc:@block_7_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:?
}
7block_7_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_expand_BN/beta*
_output_shapes
: 
?
block_7_expand_BN/beta/AssignAssignVariableOpblock_7_expand_BN/beta(block_7_expand_BN/beta/Initializer/zeros*
dtype0
~
*block_7_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_7_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
/block_7_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *0
_class&
$"loc:@block_7_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_7_expand_BN/moving_meanVarHandleOp*
shape:?*.
shared_nameblock_7_expand_BN/moving_mean*0
_class&
$"loc:@block_7_expand_BN/moving_mean*
dtype0*
_output_shapes
: 
?
>block_7_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_expand_BN/moving_mean*
_output_shapes
: 
?
$block_7_expand_BN/moving_mean/AssignAssignVariableOpblock_7_expand_BN/moving_mean/block_7_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_7_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_7_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
2block_7_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*4
_class*
(&loc:@block_7_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
!block_7_expand_BN/moving_varianceVarHandleOp*4
_class*
(&loc:@block_7_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_7_expand_BN/moving_variance
?
Bblock_7_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_7_expand_BN/moving_variance*
_output_shapes
: 
?
(block_7_expand_BN/moving_variance/AssignAssignVariableOp!block_7_expand_BN/moving_variance2block_7_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_7_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_7_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
u
 block_7_expand_BN/ReadVariableOpReadVariableOpblock_7_expand_BN/gamma*
dtype0*
_output_shapes	
:?
v
"block_7_expand_BN/ReadVariableOp_1ReadVariableOpblock_7_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
1block_7_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_7_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_7_expand_BN/FusedBatchNormV3FusedBatchNormV3block_7_expand/Conv2D block_7_expand_BN/ReadVariableOp"block_7_expand_BN/ReadVariableOp_11block_7_expand_BN/FusedBatchNormV3/ReadVariableOp3block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
\
block_7_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_7_expand_relu/Relu6Relu6"block_7_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Cblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_7_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *ފ?*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_7_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *ފ=*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Ablock_7_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_7_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*'
_output_shapes
:?
?
=block_7_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_7_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*'
_output_shapes
:?
?
"block_7_depthwise/depthwise_kernelVarHandleOp*
shape:?*3
shared_name$"block_7_depthwise/depthwise_kernel*5
_class+
)'loc:@block_7_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Cblock_7_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_7_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_7_depthwise/depthwise_kernel/AssignAssignVariableOp"block_7_depthwise/depthwise_kernel=block_7_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_7_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_7_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
*block_7_depthwise/depthwise/ReadVariableOpReadVariableOp"block_7_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
z
!block_7_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
z
)block_7_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_7_depthwise/depthwiseDepthwiseConv2dNativeblock_7_expand_relu/Relu6*block_7_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+block_7_depthwise_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*-
_class#
!loc:@block_7_depthwise_BN/gamma
?
block_7_depthwise_BN/gammaVarHandleOp*
shape:?*+
shared_nameblock_7_depthwise_BN/gamma*-
_class#
!loc:@block_7_depthwise_BN/gamma*
dtype0*
_output_shapes
: 
?
;block_7_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_depthwise_BN/gamma*
_output_shapes
: 
?
!block_7_depthwise_BN/gamma/AssignAssignVariableOpblock_7_depthwise_BN/gamma+block_7_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_7_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_7_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
+block_7_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *,
_class"
 loc:@block_7_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_7_depthwise_BN/betaVarHandleOp*
shape:?**
shared_nameblock_7_depthwise_BN/beta*,
_class"
 loc:@block_7_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
:block_7_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_depthwise_BN/beta*
_output_shapes
: 
?
 block_7_depthwise_BN/beta/AssignAssignVariableOpblock_7_depthwise_BN/beta+block_7_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_7_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_7_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_7_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *3
_class)
'%loc:@block_7_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
 block_7_depthwise_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*1
shared_name" block_7_depthwise_BN/moving_mean*3
_class)
'%loc:@block_7_depthwise_BN/moving_mean
?
Ablock_7_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_7_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_7_depthwise_BN/moving_mean/AssignAssignVariableOp block_7_depthwise_BN/moving_mean2block_7_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_7_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_7_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
5block_7_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*7
_class-
+)loc:@block_7_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
$block_7_depthwise_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*5
shared_name&$block_7_depthwise_BN/moving_variance*7
_class-
+)loc:@block_7_depthwise_BN/moving_variance
?
Eblock_7_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_7_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_7_depthwise_BN/moving_variance/AssignAssignVariableOp$block_7_depthwise_BN/moving_variance5block_7_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_7_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_7_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
{
#block_7_depthwise_BN/ReadVariableOpReadVariableOpblock_7_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
|
%block_7_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_7_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
4block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_7_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_7_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_7_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_7_depthwise/depthwise#block_7_depthwise_BN/ReadVariableOp%block_7_depthwise_BN/ReadVariableOp_14block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
_
block_7_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_7_depthwise_relu/Relu6Relu6%block_7_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
7block_7_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *)
_class
loc:@block_7_project/kernel*
dtype0*
_output_shapes
:
?
5block_7_project/kernel/Initializer/random_uniform/minConst*
valueB
 *??A?*)
_class
loc:@block_7_project/kernel*
dtype0*
_output_shapes
: 
?
5block_7_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*)
_class
loc:@block_7_project/kernel*
dtype0*
_output_shapes
: 
?
?block_7_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_7_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_7_project/kernel*
dtype0*'
_output_shapes
:?
?
5block_7_project/kernel/Initializer/random_uniform/subSub5block_7_project/kernel/Initializer/random_uniform/max5block_7_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_7_project/kernel*
_output_shapes
: 
?
5block_7_project/kernel/Initializer/random_uniform/mulMul?block_7_project/kernel/Initializer/random_uniform/RandomUniform5block_7_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_7_project/kernel*'
_output_shapes
:?
?
1block_7_project/kernel/Initializer/random_uniformAdd5block_7_project/kernel/Initializer/random_uniform/mul5block_7_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_7_project/kernel*'
_output_shapes
:?
?
block_7_project/kernelVarHandleOp*)
_class
loc:@block_7_project/kernel*
dtype0*
_output_shapes
: *
shape:?*'
shared_nameblock_7_project/kernel
}
7block_7_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_project/kernel*
_output_shapes
: 
?
block_7_project/kernel/AssignAssignVariableOpblock_7_project/kernel1block_7_project/kernel/Initializer/random_uniform*
dtype0
?
*block_7_project/kernel/Read/ReadVariableOpReadVariableOpblock_7_project/kernel*
dtype0*'
_output_shapes
:?
n
block_7_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_7_project/Conv2D/ReadVariableOpReadVariableOpblock_7_project/kernel*
dtype0*'
_output_shapes
:?
?
block_7_project/Conv2DConv2Dblock_7_depthwise_relu/Relu6%block_7_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
?
)block_7_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_7_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_7_project_BN/gammaVarHandleOp*)
shared_nameblock_7_project_BN/gamma*+
_class!
loc:@block_7_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:
?
9block_7_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_project_BN/gamma*
_output_shapes
: 
?
block_7_project_BN/gamma/AssignAssignVariableOpblock_7_project_BN/gamma)block_7_project_BN/gamma/Initializer/ones*
dtype0
?
,block_7_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_7_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_7_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    **
_class 
loc:@block_7_project_BN/beta
?
block_7_project_BN/betaVarHandleOp*(
shared_nameblock_7_project_BN/beta**
_class 
loc:@block_7_project_BN/beta*
dtype0*
_output_shapes
: *
shape:

8block_7_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_project_BN/beta*
_output_shapes
: 
?
block_7_project_BN/beta/AssignAssignVariableOpblock_7_project_BN/beta)block_7_project_BN/beta/Initializer/zeros*
dtype0

+block_7_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_7_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_7_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_7_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_7_project_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:*/
shared_name block_7_project_BN/moving_mean*1
_class'
%#loc:@block_7_project_BN/moving_mean
?
?block_7_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_7_project_BN/moving_mean*
_output_shapes
: 
?
%block_7_project_BN/moving_mean/AssignAssignVariableOpblock_7_project_BN/moving_mean0block_7_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_7_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_7_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_7_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_7_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_7_project_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:*3
shared_name$"block_7_project_BN/moving_variance*5
_class+
)'loc:@block_7_project_BN/moving_variance
?
Cblock_7_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_7_project_BN/moving_variance*
_output_shapes
: 
?
)block_7_project_BN/moving_variance/AssignAssignVariableOp"block_7_project_BN/moving_variance3block_7_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_7_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_7_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_7_project_BN/ReadVariableOpReadVariableOpblock_7_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_7_project_BN/ReadVariableOp_1ReadVariableOpblock_7_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_7_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_7_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_7_project_BN/FusedBatchNormV3FusedBatchNormV3block_7_project/Conv2D!block_7_project_BN/ReadVariableOp#block_7_project_BN/ReadVariableOp_12block_7_project_BN/FusedBatchNormV3/ReadVariableOp4block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:*
T0*
U0
]
block_7_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_7_add/addAddV2#block_6_project_BN/FusedBatchNormV3#block_7_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
6block_8_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"         ?   *(
_class
loc:@block_8_expand/kernel*
dtype0*
_output_shapes
:
?
4block_8_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *??A?*(
_class
loc:@block_8_expand/kernel*
dtype0*
_output_shapes
: 
?
4block_8_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*(
_class
loc:@block_8_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_8_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_8_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_8_expand/kernel*
dtype0*'
_output_shapes
:?
?
4block_8_expand/kernel/Initializer/random_uniform/subSub4block_8_expand/kernel/Initializer/random_uniform/max4block_8_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_8_expand/kernel*
_output_shapes
: 
?
4block_8_expand/kernel/Initializer/random_uniform/mulMul>block_8_expand/kernel/Initializer/random_uniform/RandomUniform4block_8_expand/kernel/Initializer/random_uniform/sub*'
_output_shapes
:?*
T0*(
_class
loc:@block_8_expand/kernel
?
0block_8_expand/kernel/Initializer/random_uniformAdd4block_8_expand/kernel/Initializer/random_uniform/mul4block_8_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_8_expand/kernel*'
_output_shapes
:?
?
block_8_expand/kernelVarHandleOp*&
shared_nameblock_8_expand/kernel*(
_class
loc:@block_8_expand/kernel*
dtype0*
_output_shapes
: *
shape:?
{
6block_8_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_expand/kernel*
_output_shapes
: 
?
block_8_expand/kernel/AssignAssignVariableOpblock_8_expand/kernel0block_8_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_8_expand/kernel/Read/ReadVariableOpReadVariableOpblock_8_expand/kernel*
dtype0*'
_output_shapes
:?
m
block_8_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
$block_8_expand/Conv2D/ReadVariableOpReadVariableOpblock_8_expand/kernel*
dtype0*'
_output_shapes
:?
?
block_8_expand/Conv2DConv2Dblock_7_add/add$block_8_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
(block_8_expand_BN/gamma/Initializer/onesConst*
valueB?*  ??**
_class 
loc:@block_8_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_8_expand_BN/gammaVarHandleOp*
shape:?*(
shared_nameblock_8_expand_BN/gamma**
_class 
loc:@block_8_expand_BN/gamma*
dtype0*
_output_shapes
: 

8block_8_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_expand_BN/gamma*
_output_shapes
: 
?
block_8_expand_BN/gamma/AssignAssignVariableOpblock_8_expand_BN/gamma(block_8_expand_BN/gamma/Initializer/ones*
dtype0
?
+block_8_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_8_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
(block_8_expand_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *)
_class
loc:@block_8_expand_BN/beta
?
block_8_expand_BN/betaVarHandleOp*
shape:?*'
shared_nameblock_8_expand_BN/beta*)
_class
loc:@block_8_expand_BN/beta*
dtype0*
_output_shapes
: 
}
7block_8_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_expand_BN/beta*
_output_shapes
: 
?
block_8_expand_BN/beta/AssignAssignVariableOpblock_8_expand_BN/beta(block_8_expand_BN/beta/Initializer/zeros*
dtype0
~
*block_8_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_8_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
/block_8_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *0
_class&
$"loc:@block_8_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_8_expand_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*.
shared_nameblock_8_expand_BN/moving_mean*0
_class&
$"loc:@block_8_expand_BN/moving_mean
?
>block_8_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_expand_BN/moving_mean*
_output_shapes
: 
?
$block_8_expand_BN/moving_mean/AssignAssignVariableOpblock_8_expand_BN/moving_mean/block_8_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_8_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_8_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
2block_8_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*4
_class*
(&loc:@block_8_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
!block_8_expand_BN/moving_varianceVarHandleOp*2
shared_name#!block_8_expand_BN/moving_variance*4
_class*
(&loc:@block_8_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?
?
Bblock_8_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_8_expand_BN/moving_variance*
_output_shapes
: 
?
(block_8_expand_BN/moving_variance/AssignAssignVariableOp!block_8_expand_BN/moving_variance2block_8_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_8_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_8_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
u
 block_8_expand_BN/ReadVariableOpReadVariableOpblock_8_expand_BN/gamma*
dtype0*
_output_shapes	
:?
v
"block_8_expand_BN/ReadVariableOp_1ReadVariableOpblock_8_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
1block_8_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_8_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_8_expand_BN/FusedBatchNormV3FusedBatchNormV3block_8_expand/Conv2D block_8_expand_BN/ReadVariableOp"block_8_expand_BN/ReadVariableOp_11block_8_expand_BN/FusedBatchNormV3/ReadVariableOp3block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
\
block_8_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_8_expand_relu/Relu6Relu6"block_8_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Cblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_8_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *ފ?*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_8_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *ފ=*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel
?
Kblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Ablock_8_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel
?
Ablock_8_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*'
_output_shapes
:?
?
=block_8_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_8_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*'
_output_shapes
:?
?
"block_8_depthwise/depthwise_kernelVarHandleOp*
shape:?*3
shared_name$"block_8_depthwise/depthwise_kernel*5
_class+
)'loc:@block_8_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Cblock_8_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_8_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_8_depthwise/depthwise_kernel/AssignAssignVariableOp"block_8_depthwise/depthwise_kernel=block_8_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_8_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_8_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
*block_8_depthwise/depthwise/ReadVariableOpReadVariableOp"block_8_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
z
!block_8_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
z
)block_8_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_8_depthwise/depthwiseDepthwiseConv2dNativeblock_8_expand_relu/Relu6*block_8_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+block_8_depthwise_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*-
_class#
!loc:@block_8_depthwise_BN/gamma
?
block_8_depthwise_BN/gammaVarHandleOp*+
shared_nameblock_8_depthwise_BN/gamma*-
_class#
!loc:@block_8_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
;block_8_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_depthwise_BN/gamma*
_output_shapes
: 
?
!block_8_depthwise_BN/gamma/AssignAssignVariableOpblock_8_depthwise_BN/gamma+block_8_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_8_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_8_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
+block_8_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *,
_class"
 loc:@block_8_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_8_depthwise_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?**
shared_nameblock_8_depthwise_BN/beta*,
_class"
 loc:@block_8_depthwise_BN/beta
?
:block_8_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_depthwise_BN/beta*
_output_shapes
: 
?
 block_8_depthwise_BN/beta/AssignAssignVariableOpblock_8_depthwise_BN/beta+block_8_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_8_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_8_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_8_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *3
_class)
'%loc:@block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
 block_8_depthwise_BN/moving_meanVarHandleOp*3
_class)
'%loc:@block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*1
shared_name" block_8_depthwise_BN/moving_mean
?
Ablock_8_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_8_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_8_depthwise_BN/moving_mean/AssignAssignVariableOp block_8_depthwise_BN/moving_mean2block_8_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_8_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
5block_8_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*7
_class-
+)loc:@block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
$block_8_depthwise_BN/moving_varianceVarHandleOp*
shape:?*5
shared_name&$block_8_depthwise_BN/moving_variance*7
_class-
+)loc:@block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Eblock_8_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_8_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_8_depthwise_BN/moving_variance/AssignAssignVariableOp$block_8_depthwise_BN/moving_variance5block_8_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_8_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
{
#block_8_depthwise_BN/ReadVariableOpReadVariableOpblock_8_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
|
%block_8_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_8_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
4block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_8_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_8_depthwise/depthwise#block_8_depthwise_BN/ReadVariableOp%block_8_depthwise_BN/ReadVariableOp_14block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
_
block_8_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_8_depthwise_relu/Relu6Relu6%block_8_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
7block_8_project/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      *)
_class
loc:@block_8_project/kernel
?
5block_8_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *??A?*)
_class
loc:@block_8_project/kernel
?
5block_8_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*)
_class
loc:@block_8_project/kernel*
dtype0*
_output_shapes
: 
?
?block_8_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_8_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_8_project/kernel*
dtype0*'
_output_shapes
:?
?
5block_8_project/kernel/Initializer/random_uniform/subSub5block_8_project/kernel/Initializer/random_uniform/max5block_8_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_8_project/kernel*
_output_shapes
: 
?
5block_8_project/kernel/Initializer/random_uniform/mulMul?block_8_project/kernel/Initializer/random_uniform/RandomUniform5block_8_project/kernel/Initializer/random_uniform/sub*'
_output_shapes
:?*
T0*)
_class
loc:@block_8_project/kernel
?
1block_8_project/kernel/Initializer/random_uniformAdd5block_8_project/kernel/Initializer/random_uniform/mul5block_8_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_8_project/kernel*'
_output_shapes
:?
?
block_8_project/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*'
shared_nameblock_8_project/kernel*)
_class
loc:@block_8_project/kernel
}
7block_8_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_project/kernel*
_output_shapes
: 
?
block_8_project/kernel/AssignAssignVariableOpblock_8_project/kernel1block_8_project/kernel/Initializer/random_uniform*
dtype0
?
*block_8_project/kernel/Read/ReadVariableOpReadVariableOpblock_8_project/kernel*
dtype0*'
_output_shapes
:?
n
block_8_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_8_project/Conv2D/ReadVariableOpReadVariableOpblock_8_project/kernel*
dtype0*'
_output_shapes
:?
?
block_8_project/Conv2DConv2Dblock_8_depthwise_relu/Relu6%block_8_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
)block_8_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_8_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_8_project_BN/gammaVarHandleOp*
shape:*)
shared_nameblock_8_project_BN/gamma*+
_class!
loc:@block_8_project_BN/gamma*
dtype0*
_output_shapes
: 
?
9block_8_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_project_BN/gamma*
_output_shapes
: 
?
block_8_project_BN/gamma/AssignAssignVariableOpblock_8_project_BN/gamma)block_8_project_BN/gamma/Initializer/ones*
dtype0
?
,block_8_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_8_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_8_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_8_project_BN/beta*
dtype0*
_output_shapes
:
?
block_8_project_BN/betaVarHandleOp*
shape:*(
shared_nameblock_8_project_BN/beta**
_class 
loc:@block_8_project_BN/beta*
dtype0*
_output_shapes
: 

8block_8_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_project_BN/beta*
_output_shapes
: 
?
block_8_project_BN/beta/AssignAssignVariableOpblock_8_project_BN/beta)block_8_project_BN/beta/Initializer/zeros*
dtype0

+block_8_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_8_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_8_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_8_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_8_project_BN/moving_meanVarHandleOp*/
shared_name block_8_project_BN/moving_mean*1
_class'
%#loc:@block_8_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:
?
?block_8_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_8_project_BN/moving_mean*
_output_shapes
: 
?
%block_8_project_BN/moving_mean/AssignAssignVariableOpblock_8_project_BN/moving_mean0block_8_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_8_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_8_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_8_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*5
_class+
)'loc:@block_8_project_BN/moving_variance
?
"block_8_project_BN/moving_varianceVarHandleOp*3
shared_name$"block_8_project_BN/moving_variance*5
_class+
)'loc:@block_8_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:
?
Cblock_8_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_8_project_BN/moving_variance*
_output_shapes
: 
?
)block_8_project_BN/moving_variance/AssignAssignVariableOp"block_8_project_BN/moving_variance3block_8_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_8_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_8_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_8_project_BN/ReadVariableOpReadVariableOpblock_8_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_8_project_BN/ReadVariableOp_1ReadVariableOpblock_8_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_8_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_8_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_8_project_BN/FusedBatchNormV3FusedBatchNormV3block_8_project/Conv2D!block_8_project_BN/ReadVariableOp#block_8_project_BN/ReadVariableOp_12block_8_project_BN/FusedBatchNormV3/ReadVariableOp4block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
]
block_8_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_8_add/addAddV2block_7_add/add#block_8_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
6block_9_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"         ?   *(
_class
loc:@block_9_expand/kernel*
dtype0*
_output_shapes
:
?
4block_9_expand/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *??A?*(
_class
loc:@block_9_expand/kernel
?
4block_9_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*(
_class
loc:@block_9_expand/kernel*
dtype0*
_output_shapes
: 
?
>block_9_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform6block_9_expand/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@block_9_expand/kernel*
dtype0*'
_output_shapes
:?
?
4block_9_expand/kernel/Initializer/random_uniform/subSub4block_9_expand/kernel/Initializer/random_uniform/max4block_9_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_9_expand/kernel*
_output_shapes
: 
?
4block_9_expand/kernel/Initializer/random_uniform/mulMul>block_9_expand/kernel/Initializer/random_uniform/RandomUniform4block_9_expand/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@block_9_expand/kernel*'
_output_shapes
:?
?
0block_9_expand/kernel/Initializer/random_uniformAdd4block_9_expand/kernel/Initializer/random_uniform/mul4block_9_expand/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@block_9_expand/kernel*'
_output_shapes
:?
?
block_9_expand/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*&
shared_nameblock_9_expand/kernel*(
_class
loc:@block_9_expand/kernel
{
6block_9_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_expand/kernel*
_output_shapes
: 
?
block_9_expand/kernel/AssignAssignVariableOpblock_9_expand/kernel0block_9_expand/kernel/Initializer/random_uniform*
dtype0
?
)block_9_expand/kernel/Read/ReadVariableOpReadVariableOpblock_9_expand/kernel*
dtype0*'
_output_shapes
:?
m
block_9_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
$block_9_expand/Conv2D/ReadVariableOpReadVariableOpblock_9_expand/kernel*
dtype0*'
_output_shapes
:?
?
block_9_expand/Conv2DConv2Dblock_8_add/add$block_9_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
(block_9_expand_BN/gamma/Initializer/onesConst*
valueB?*  ??**
_class 
loc:@block_9_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_9_expand_BN/gammaVarHandleOp*
shape:?*(
shared_nameblock_9_expand_BN/gamma**
_class 
loc:@block_9_expand_BN/gamma*
dtype0*
_output_shapes
: 

8block_9_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_expand_BN/gamma*
_output_shapes
: 
?
block_9_expand_BN/gamma/AssignAssignVariableOpblock_9_expand_BN/gamma(block_9_expand_BN/gamma/Initializer/ones*
dtype0
?
+block_9_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_9_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
(block_9_expand_BN/beta/Initializer/zerosConst*
valueB?*    *)
_class
loc:@block_9_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_9_expand_BN/betaVarHandleOp*)
_class
loc:@block_9_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:?*'
shared_nameblock_9_expand_BN/beta
}
7block_9_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_expand_BN/beta*
_output_shapes
: 
?
block_9_expand_BN/beta/AssignAssignVariableOpblock_9_expand_BN/beta(block_9_expand_BN/beta/Initializer/zeros*
dtype0
~
*block_9_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_9_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
/block_9_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *0
_class&
$"loc:@block_9_expand_BN/moving_mean
?
block_9_expand_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*.
shared_nameblock_9_expand_BN/moving_mean*0
_class&
$"loc:@block_9_expand_BN/moving_mean
?
>block_9_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_expand_BN/moving_mean*
_output_shapes
: 
?
$block_9_expand_BN/moving_mean/AssignAssignVariableOpblock_9_expand_BN/moving_mean/block_9_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
1block_9_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_9_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
2block_9_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*4
_class*
(&loc:@block_9_expand_BN/moving_variance
?
!block_9_expand_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_9_expand_BN/moving_variance*4
_class*
(&loc:@block_9_expand_BN/moving_variance
?
Bblock_9_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_9_expand_BN/moving_variance*
_output_shapes
: 
?
(block_9_expand_BN/moving_variance/AssignAssignVariableOp!block_9_expand_BN/moving_variance2block_9_expand_BN/moving_variance/Initializer/ones*
dtype0
?
5block_9_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp!block_9_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
u
 block_9_expand_BN/ReadVariableOpReadVariableOpblock_9_expand_BN/gamma*
dtype0*
_output_shapes	
:?
v
"block_9_expand_BN/ReadVariableOp_1ReadVariableOpblock_9_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
1block_9_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_9_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_9_expand_BN/FusedBatchNormV3FusedBatchNormV3block_9_expand/Conv2D block_9_expand_BN/ReadVariableOp"block_9_expand_BN/ReadVariableOp_11block_9_expand_BN/FusedBatchNormV3/ReadVariableOp3block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
\
block_9_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_9_expand_relu/Relu6Relu6"block_9_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Cblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Ablock_9_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *ފ?*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Ablock_9_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *ފ=*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Kblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformCblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Ablock_9_depthwise/depthwise_kernel/Initializer/random_uniform/subSubAblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/maxAblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
_output_shapes
: 
?
Ablock_9_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulKblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformAblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*'
_output_shapes
:?
?
=block_9_depthwise/depthwise_kernel/Initializer/random_uniformAddAblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/mulAblock_9_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*'
_output_shapes
:?
?
"block_9_depthwise/depthwise_kernelVarHandleOp*5
_class+
)'loc:@block_9_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: *
shape:?*3
shared_name$"block_9_depthwise/depthwise_kernel
?
Cblock_9_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_9_depthwise/depthwise_kernel*
_output_shapes
: 
?
)block_9_depthwise/depthwise_kernel/AssignAssignVariableOp"block_9_depthwise/depthwise_kernel=block_9_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
6block_9_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp"block_9_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
*block_9_depthwise/depthwise/ReadVariableOpReadVariableOp"block_9_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
z
!block_9_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
z
)block_9_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_9_depthwise/depthwiseDepthwiseConv2dNativeblock_9_expand_relu/Relu6*block_9_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
+block_9_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*-
_class#
!loc:@block_9_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_9_depthwise_BN/gammaVarHandleOp*
shape:?*+
shared_nameblock_9_depthwise_BN/gamma*-
_class#
!loc:@block_9_depthwise_BN/gamma*
dtype0*
_output_shapes
: 
?
;block_9_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_depthwise_BN/gamma*
_output_shapes
: 
?
!block_9_depthwise_BN/gamma/AssignAssignVariableOpblock_9_depthwise_BN/gamma+block_9_depthwise_BN/gamma/Initializer/ones*
dtype0
?
.block_9_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_9_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
+block_9_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *,
_class"
 loc:@block_9_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_9_depthwise_BN/betaVarHandleOp*
shape:?**
shared_nameblock_9_depthwise_BN/beta*,
_class"
 loc:@block_9_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
:block_9_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_depthwise_BN/beta*
_output_shapes
: 
?
 block_9_depthwise_BN/beta/AssignAssignVariableOpblock_9_depthwise_BN/beta+block_9_depthwise_BN/beta/Initializer/zeros*
dtype0
?
-block_9_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_9_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_9_depthwise_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *3
_class)
'%loc:@block_9_depthwise_BN/moving_mean
?
 block_9_depthwise_BN/moving_meanVarHandleOp*3
_class)
'%loc:@block_9_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*1
shared_name" block_9_depthwise_BN/moving_mean
?
Ablock_9_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp block_9_depthwise_BN/moving_mean*
_output_shapes
: 
?
'block_9_depthwise_BN/moving_mean/AssignAssignVariableOp block_9_depthwise_BN/moving_mean2block_9_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
4block_9_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp block_9_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
5block_9_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*7
_class-
+)loc:@block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
$block_9_depthwise_BN/moving_varianceVarHandleOp*
shape:?*5
shared_name&$block_9_depthwise_BN/moving_variance*7
_class-
+)loc:@block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Eblock_9_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp$block_9_depthwise_BN/moving_variance*
_output_shapes
: 
?
+block_9_depthwise_BN/moving_variance/AssignAssignVariableOp$block_9_depthwise_BN/moving_variance5block_9_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
8block_9_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp$block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
{
#block_9_depthwise_BN/ReadVariableOpReadVariableOpblock_9_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
|
%block_9_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_9_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
4block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_9_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_9_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_9_depthwise/depthwise#block_9_depthwise_BN/ReadVariableOp%block_9_depthwise_BN/ReadVariableOp_14block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp6block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
_
block_9_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_9_depthwise_relu/Relu6Relu6%block_9_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
7block_9_project/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      *)
_class
loc:@block_9_project/kernel
?
5block_9_project/kernel/Initializer/random_uniform/minConst*
valueB
 *??A?*)
_class
loc:@block_9_project/kernel*
dtype0*
_output_shapes
: 
?
5block_9_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*)
_class
loc:@block_9_project/kernel*
dtype0*
_output_shapes
: 
?
?block_9_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_9_project/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_9_project/kernel*
dtype0*'
_output_shapes
:?
?
5block_9_project/kernel/Initializer/random_uniform/subSub5block_9_project/kernel/Initializer/random_uniform/max5block_9_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_9_project/kernel*
_output_shapes
: 
?
5block_9_project/kernel/Initializer/random_uniform/mulMul?block_9_project/kernel/Initializer/random_uniform/RandomUniform5block_9_project/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_9_project/kernel*'
_output_shapes
:?
?
1block_9_project/kernel/Initializer/random_uniformAdd5block_9_project/kernel/Initializer/random_uniform/mul5block_9_project/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_9_project/kernel*'
_output_shapes
:?
?
block_9_project/kernelVarHandleOp*)
_class
loc:@block_9_project/kernel*
dtype0*
_output_shapes
: *
shape:?*'
shared_nameblock_9_project/kernel
}
7block_9_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_project/kernel*
_output_shapes
: 
?
block_9_project/kernel/AssignAssignVariableOpblock_9_project/kernel1block_9_project/kernel/Initializer/random_uniform*
dtype0
?
*block_9_project/kernel/Read/ReadVariableOpReadVariableOpblock_9_project/kernel*
dtype0*'
_output_shapes
:?
n
block_9_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_9_project/Conv2D/ReadVariableOpReadVariableOpblock_9_project/kernel*
dtype0*'
_output_shapes
:?
?
block_9_project/Conv2DConv2Dblock_9_depthwise_relu/Relu6%block_9_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
?
)block_9_project_BN/gamma/Initializer/onesConst*
valueB*  ??*+
_class!
loc:@block_9_project_BN/gamma*
dtype0*
_output_shapes
:
?
block_9_project_BN/gammaVarHandleOp*
shape:*)
shared_nameblock_9_project_BN/gamma*+
_class!
loc:@block_9_project_BN/gamma*
dtype0*
_output_shapes
: 
?
9block_9_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_project_BN/gamma*
_output_shapes
: 
?
block_9_project_BN/gamma/AssignAssignVariableOpblock_9_project_BN/gamma)block_9_project_BN/gamma/Initializer/ones*
dtype0
?
,block_9_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_9_project_BN/gamma*
dtype0*
_output_shapes
:
?
)block_9_project_BN/beta/Initializer/zerosConst*
valueB*    **
_class 
loc:@block_9_project_BN/beta*
dtype0*
_output_shapes
:
?
block_9_project_BN/betaVarHandleOp*
shape:*(
shared_nameblock_9_project_BN/beta**
_class 
loc:@block_9_project_BN/beta*
dtype0*
_output_shapes
: 

8block_9_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_project_BN/beta*
_output_shapes
: 
?
block_9_project_BN/beta/AssignAssignVariableOpblock_9_project_BN/beta)block_9_project_BN/beta/Initializer/zeros*
dtype0

+block_9_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_9_project_BN/beta*
dtype0*
_output_shapes
:
?
0block_9_project_BN/moving_mean/Initializer/zerosConst*
valueB*    *1
_class'
%#loc:@block_9_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
block_9_project_BN/moving_meanVarHandleOp*
shape:*/
shared_name block_9_project_BN/moving_mean*1
_class'
%#loc:@block_9_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
?block_9_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_9_project_BN/moving_mean*
_output_shapes
: 
?
%block_9_project_BN/moving_mean/AssignAssignVariableOpblock_9_project_BN/moving_mean0block_9_project_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_9_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_9_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
3block_9_project_BN/moving_variance/Initializer/onesConst*
valueB*  ??*5
_class+
)'loc:@block_9_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
"block_9_project_BN/moving_varianceVarHandleOp*
shape:*3
shared_name$"block_9_project_BN/moving_variance*5
_class+
)'loc:@block_9_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_9_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_9_project_BN/moving_variance*
_output_shapes
: 
?
)block_9_project_BN/moving_variance/AssignAssignVariableOp"block_9_project_BN/moving_variance3block_9_project_BN/moving_variance/Initializer/ones*
dtype0
?
6block_9_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_9_project_BN/moving_variance*
dtype0*
_output_shapes
:
v
!block_9_project_BN/ReadVariableOpReadVariableOpblock_9_project_BN/gamma*
dtype0*
_output_shapes
:
w
#block_9_project_BN/ReadVariableOp_1ReadVariableOpblock_9_project_BN/beta*
dtype0*
_output_shapes
:
?
2block_9_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
4block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_9_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
#block_9_project_BN/FusedBatchNormV3FusedBatchNormV3block_9_project/Conv2D!block_9_project_BN/ReadVariableOp#block_9_project_BN/ReadVariableOp_12block_9_project_BN/FusedBatchNormV3/ReadVariableOp4block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:
]
block_9_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_9_add/addAddV2block_8_add/add#block_9_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
7block_10_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"         ?   *)
_class
loc:@block_10_expand/kernel
?
5block_10_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *??A?*)
_class
loc:@block_10_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_10_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *??A>*)
_class
loc:@block_10_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_10_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_10_expand/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:?*
T0*)
_class
loc:@block_10_expand/kernel
?
5block_10_expand/kernel/Initializer/random_uniform/subSub5block_10_expand/kernel/Initializer/random_uniform/max5block_10_expand/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_10_expand/kernel
?
5block_10_expand/kernel/Initializer/random_uniform/mulMul?block_10_expand/kernel/Initializer/random_uniform/RandomUniform5block_10_expand/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_10_expand/kernel*'
_output_shapes
:?
?
1block_10_expand/kernel/Initializer/random_uniformAdd5block_10_expand/kernel/Initializer/random_uniform/mul5block_10_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_10_expand/kernel*'
_output_shapes
:?
?
block_10_expand/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*'
shared_nameblock_10_expand/kernel*)
_class
loc:@block_10_expand/kernel
}
7block_10_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_expand/kernel*
_output_shapes
: 
?
block_10_expand/kernel/AssignAssignVariableOpblock_10_expand/kernel1block_10_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_10_expand/kernel/Read/ReadVariableOpReadVariableOpblock_10_expand/kernel*
dtype0*'
_output_shapes
:?
n
block_10_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_10_expand/Conv2D/ReadVariableOpReadVariableOpblock_10_expand/kernel*
dtype0*'
_output_shapes
:?
?
block_10_expand/Conv2DConv2Dblock_9_add/add%block_10_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
)block_10_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*+
_class!
loc:@block_10_expand_BN/gamma
?
block_10_expand_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*)
shared_nameblock_10_expand_BN/gamma*+
_class!
loc:@block_10_expand_BN/gamma
?
9block_10_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_expand_BN/gamma*
_output_shapes
: 
?
block_10_expand_BN/gamma/AssignAssignVariableOpblock_10_expand_BN/gamma)block_10_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_10_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_10_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_10_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_10_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_10_expand_BN/betaVarHandleOp**
_class 
loc:@block_10_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:?*(
shared_nameblock_10_expand_BN/beta

8block_10_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_expand_BN/beta*
_output_shapes
: 
?
block_10_expand_BN/beta/AssignAssignVariableOpblock_10_expand_BN/beta)block_10_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_10_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_10_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_10_expand_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *1
_class'
%#loc:@block_10_expand_BN/moving_mean
?
block_10_expand_BN/moving_meanVarHandleOp*/
shared_name block_10_expand_BN/moving_mean*1
_class'
%#loc:@block_10_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?
?
?block_10_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_expand_BN/moving_mean*
_output_shapes
: 
?
%block_10_expand_BN/moving_mean/AssignAssignVariableOpblock_10_expand_BN/moving_mean0block_10_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_10_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_10_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_10_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*5
_class+
)'loc:@block_10_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_10_expand_BN/moving_varianceVarHandleOp*3
shared_name$"block_10_expand_BN/moving_variance*5
_class+
)'loc:@block_10_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?
?
Cblock_10_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_10_expand_BN/moving_variance*
_output_shapes
: 
?
)block_10_expand_BN/moving_variance/AssignAssignVariableOp"block_10_expand_BN/moving_variance3block_10_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_10_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_10_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_10_expand_BN/ReadVariableOpReadVariableOpblock_10_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_10_expand_BN/ReadVariableOp_1ReadVariableOpblock_10_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_10_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_10_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_10_expand_BN/FusedBatchNormV3FusedBatchNormV3block_10_expand/Conv2D!block_10_expand_BN/ReadVariableOp#block_10_expand_BN/ReadVariableOp_12block_10_expand_BN/FusedBatchNormV3/ReadVariableOp4block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
]
block_10_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_10_expand_relu/Relu6Relu6#block_10_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Dblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *ފ?*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Bblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *ފ=*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Lblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel
?
Bblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_10_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_10_depthwise/depthwise_kernel/Initializer/random_uniform/min*'
_output_shapes
:?*
T0*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel
?
#block_10_depthwise/depthwise_kernelVarHandleOp*6
_class,
*(loc:@block_10_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: *
shape:?*4
shared_name%#block_10_depthwise/depthwise_kernel
?
Dblock_10_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_10_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_10_depthwise/depthwise_kernel/AssignAssignVariableOp#block_10_depthwise/depthwise_kernel>block_10_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_10_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_10_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_10_depthwise/depthwise/ReadVariableOpReadVariableOp#block_10_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_10_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
{
*block_10_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
block_10_depthwise/depthwiseDepthwiseConv2dNativeblock_10_expand_relu/Relu6+block_10_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
,block_10_depthwise_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*.
_class$
" loc:@block_10_depthwise_BN/gamma
?
block_10_depthwise_BN/gammaVarHandleOp*,
shared_nameblock_10_depthwise_BN/gamma*.
_class$
" loc:@block_10_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
<block_10_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_depthwise_BN/gamma*
_output_shapes
: 
?
"block_10_depthwise_BN/gamma/AssignAssignVariableOpblock_10_depthwise_BN/gamma,block_10_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_10_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_10_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_10_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_10_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_10_depthwise_BN/betaVarHandleOp*
shape:?*+
shared_nameblock_10_depthwise_BN/beta*-
_class#
!loc:@block_10_depthwise_BN/beta*
dtype0*
_output_shapes
: 
?
;block_10_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_depthwise_BN/beta*
_output_shapes
: 
?
!block_10_depthwise_BN/beta/AssignAssignVariableOpblock_10_depthwise_BN/beta,block_10_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_10_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_10_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_10_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_10_depthwise_BN/moving_meanVarHandleOp*4
_class*
(&loc:@block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_10_depthwise_BN/moving_mean
?
Bblock_10_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_10_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_10_depthwise_BN/moving_mean/AssignAssignVariableOp!block_10_depthwise_BN/moving_mean3block_10_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_10_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_10_depthwise_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*8
_class.
,*loc:@block_10_depthwise_BN/moving_variance
?
%block_10_depthwise_BN/moving_varianceVarHandleOp*8
_class.
,*loc:@block_10_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*6
shared_name'%block_10_depthwise_BN/moving_variance
?
Fblock_10_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_10_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_10_depthwise_BN/moving_variance/AssignAssignVariableOp%block_10_depthwise_BN/moving_variance6block_10_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_10_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_10_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_10_depthwise_BN/ReadVariableOpReadVariableOpblock_10_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_10_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_10_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_10_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_10_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_10_depthwise/depthwise$block_10_depthwise_BN/ReadVariableOp&block_10_depthwise_BN/ReadVariableOp_15block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
`
block_10_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_10_depthwise_relu/Relu6Relu6&block_10_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
8block_10_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?       **
_class 
loc:@block_10_project/kernel*
dtype0*
_output_shapes
:
?
6block_10_project/kernel/Initializer/random_uniform/minConst*
valueB
 *?=?**
_class 
loc:@block_10_project/kernel*
dtype0*
_output_shapes
: 
?
6block_10_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?=>**
_class 
loc:@block_10_project/kernel*
dtype0*
_output_shapes
: 
?
@block_10_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_10_project/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:? *
T0**
_class 
loc:@block_10_project/kernel
?
6block_10_project/kernel/Initializer/random_uniform/subSub6block_10_project/kernel/Initializer/random_uniform/max6block_10_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_10_project/kernel*
_output_shapes
: 
?
6block_10_project/kernel/Initializer/random_uniform/mulMul@block_10_project/kernel/Initializer/random_uniform/RandomUniform6block_10_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_10_project/kernel*'
_output_shapes
:? 
?
2block_10_project/kernel/Initializer/random_uniformAdd6block_10_project/kernel/Initializer/random_uniform/mul6block_10_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_10_project/kernel*'
_output_shapes
:? 
?
block_10_project/kernelVarHandleOp**
_class 
loc:@block_10_project/kernel*
dtype0*
_output_shapes
: *
shape:? *(
shared_nameblock_10_project/kernel

8block_10_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_project/kernel*
_output_shapes
: 
?
block_10_project/kernel/AssignAssignVariableOpblock_10_project/kernel2block_10_project/kernel/Initializer/random_uniform*
dtype0
?
+block_10_project/kernel/Read/ReadVariableOpReadVariableOpblock_10_project/kernel*
dtype0*'
_output_shapes
:? 
o
block_10_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
&block_10_project/Conv2D/ReadVariableOpReadVariableOpblock_10_project/kernel*
dtype0*'
_output_shapes
:? 
?
block_10_project/Conv2DConv2Dblock_10_depthwise_relu/Relu6&block_10_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:????????? *
paddingSAME*
T0
?
*block_10_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
: *
valueB *  ??*,
_class"
 loc:@block_10_project_BN/gamma
?
block_10_project_BN/gammaVarHandleOp**
shared_nameblock_10_project_BN/gamma*,
_class"
 loc:@block_10_project_BN/gamma*
dtype0*
_output_shapes
: *
shape: 
?
:block_10_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_project_BN/gamma*
_output_shapes
: 
?
 block_10_project_BN/gamma/AssignAssignVariableOpblock_10_project_BN/gamma*block_10_project_BN/gamma/Initializer/ones*
dtype0
?
-block_10_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_10_project_BN/gamma*
dtype0*
_output_shapes
: 
?
*block_10_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB *    *+
_class!
loc:@block_10_project_BN/beta
?
block_10_project_BN/betaVarHandleOp*+
_class!
loc:@block_10_project_BN/beta*
dtype0*
_output_shapes
: *
shape: *)
shared_nameblock_10_project_BN/beta
?
9block_10_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_project_BN/beta*
_output_shapes
: 
?
block_10_project_BN/beta/AssignAssignVariableOpblock_10_project_BN/beta*block_10_project_BN/beta/Initializer/zeros*
dtype0
?
,block_10_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_10_project_BN/beta*
dtype0*
_output_shapes
: 
?
1block_10_project_BN/moving_mean/Initializer/zerosConst*
valueB *    *2
_class(
&$loc:@block_10_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
block_10_project_BN/moving_meanVarHandleOp*2
_class(
&$loc:@block_10_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape: *0
shared_name!block_10_project_BN/moving_mean
?
@block_10_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_10_project_BN/moving_mean*
_output_shapes
: 
?
&block_10_project_BN/moving_mean/AssignAssignVariableOpblock_10_project_BN/moving_mean1block_10_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_10_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_10_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
4block_10_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
: *
valueB *  ??*6
_class,
*(loc:@block_10_project_BN/moving_variance
?
#block_10_project_BN/moving_varianceVarHandleOp*6
_class,
*(loc:@block_10_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape: *4
shared_name%#block_10_project_BN/moving_variance
?
Dblock_10_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_10_project_BN/moving_variance*
_output_shapes
: 
?
*block_10_project_BN/moving_variance/AssignAssignVariableOp#block_10_project_BN/moving_variance4block_10_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_10_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_10_project_BN/moving_variance*
dtype0*
_output_shapes
: 
x
"block_10_project_BN/ReadVariableOpReadVariableOpblock_10_project_BN/gamma*
dtype0*
_output_shapes
: 
y
$block_10_project_BN/ReadVariableOp_1ReadVariableOpblock_10_project_BN/beta*
dtype0*
_output_shapes
: 
?
3block_10_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
5block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_10_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
$block_10_project_BN/FusedBatchNormV3FusedBatchNormV3block_10_project/Conv2D"block_10_project_BN/ReadVariableOp$block_10_project_BN/ReadVariableOp_13block_10_project_BN/FusedBatchNormV3/ReadVariableOp5block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( 
^
block_10_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
7block_11_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"          ?   *)
_class
loc:@block_11_expand/kernel
?
5block_11_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *b?'?*)
_class
loc:@block_11_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_11_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b?'>*)
_class
loc:@block_11_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_11_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_11_expand/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
: ?*
T0*)
_class
loc:@block_11_expand/kernel
?
5block_11_expand/kernel/Initializer/random_uniform/subSub5block_11_expand/kernel/Initializer/random_uniform/max5block_11_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_11_expand/kernel*
_output_shapes
: 
?
5block_11_expand/kernel/Initializer/random_uniform/mulMul?block_11_expand/kernel/Initializer/random_uniform/RandomUniform5block_11_expand/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_11_expand/kernel*'
_output_shapes
: ?
?
1block_11_expand/kernel/Initializer/random_uniformAdd5block_11_expand/kernel/Initializer/random_uniform/mul5block_11_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_11_expand/kernel*'
_output_shapes
: ?
?
block_11_expand/kernelVarHandleOp*'
shared_nameblock_11_expand/kernel*)
_class
loc:@block_11_expand/kernel*
dtype0*
_output_shapes
: *
shape: ?
}
7block_11_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_expand/kernel*
_output_shapes
: 
?
block_11_expand/kernel/AssignAssignVariableOpblock_11_expand/kernel1block_11_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_11_expand/kernel/Read/ReadVariableOpReadVariableOpblock_11_expand/kernel*
dtype0*'
_output_shapes
: ?
n
block_11_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_11_expand/Conv2D/ReadVariableOpReadVariableOpblock_11_expand/kernel*
dtype0*'
_output_shapes
: ?
?
block_11_expand/Conv2DConv2D$block_10_project_BN/FusedBatchNormV3%block_11_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
)block_11_expand_BN/gamma/Initializer/onesConst*
valueB?*  ??*+
_class!
loc:@block_11_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_11_expand_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*)
shared_nameblock_11_expand_BN/gamma*+
_class!
loc:@block_11_expand_BN/gamma
?
9block_11_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_expand_BN/gamma*
_output_shapes
: 
?
block_11_expand_BN/gamma/AssignAssignVariableOpblock_11_expand_BN/gamma)block_11_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_11_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_11_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_11_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_11_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_11_expand_BN/betaVarHandleOp*
shape:?*(
shared_nameblock_11_expand_BN/beta**
_class 
loc:@block_11_expand_BN/beta*
dtype0*
_output_shapes
: 

8block_11_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_expand_BN/beta*
_output_shapes
: 
?
block_11_expand_BN/beta/AssignAssignVariableOpblock_11_expand_BN/beta)block_11_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_11_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_11_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_11_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_11_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_11_expand_BN/moving_meanVarHandleOp*/
shared_name block_11_expand_BN/moving_mean*1
_class'
%#loc:@block_11_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?
?
?block_11_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_expand_BN/moving_mean*
_output_shapes
: 
?
%block_11_expand_BN/moving_mean/AssignAssignVariableOpblock_11_expand_BN/moving_mean0block_11_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_11_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_11_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_11_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*5
_class+
)'loc:@block_11_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_11_expand_BN/moving_varianceVarHandleOp*
shape:?*3
shared_name$"block_11_expand_BN/moving_variance*5
_class+
)'loc:@block_11_expand_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_11_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_11_expand_BN/moving_variance*
_output_shapes
: 
?
)block_11_expand_BN/moving_variance/AssignAssignVariableOp"block_11_expand_BN/moving_variance3block_11_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_11_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_11_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_11_expand_BN/ReadVariableOpReadVariableOpblock_11_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_11_expand_BN/ReadVariableOp_1ReadVariableOpblock_11_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_11_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_11_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_11_expand_BN/FusedBatchNormV3FusedBatchNormV3block_11_expand/Conv2D!block_11_expand_BN/ReadVariableOp#block_11_expand_BN/ReadVariableOp_12block_11_expand_BN/FusedBatchNormV3/ReadVariableOp4block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
]
block_11_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_11_expand_relu/Relu6Relu6#block_11_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Dblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *??p?*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel
?
Bblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *??p=*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Lblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*
_output_shapes
: 
?
Bblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_11_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_11_depthwise/depthwise_kernel/Initializer/random_uniform/min*'
_output_shapes
:?*
T0*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel
?
#block_11_depthwise/depthwise_kernelVarHandleOp*
shape:?*4
shared_name%#block_11_depthwise/depthwise_kernel*6
_class,
*(loc:@block_11_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Dblock_11_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_11_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_11_depthwise/depthwise_kernel/AssignAssignVariableOp#block_11_depthwise/depthwise_kernel>block_11_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_11_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_11_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_11_depthwise/depthwise/ReadVariableOpReadVariableOp#block_11_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_11_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
{
*block_11_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_11_depthwise/depthwiseDepthwiseConv2dNativeblock_11_expand_relu/Relu6+block_11_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
,block_11_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*.
_class$
" loc:@block_11_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_11_depthwise_BN/gammaVarHandleOp*
shape:?*,
shared_nameblock_11_depthwise_BN/gamma*.
_class$
" loc:@block_11_depthwise_BN/gamma*
dtype0*
_output_shapes
: 
?
<block_11_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_depthwise_BN/gamma*
_output_shapes
: 
?
"block_11_depthwise_BN/gamma/AssignAssignVariableOpblock_11_depthwise_BN/gamma,block_11_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_11_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_11_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_11_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_11_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_11_depthwise_BN/betaVarHandleOp*-
_class#
!loc:@block_11_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:?*+
shared_nameblock_11_depthwise_BN/beta
?
;block_11_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_depthwise_BN/beta*
_output_shapes
: 
?
!block_11_depthwise_BN/beta/AssignAssignVariableOpblock_11_depthwise_BN/beta,block_11_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_11_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_11_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_11_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_11_depthwise_BN/moving_meanVarHandleOp*4
_class*
(&loc:@block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_11_depthwise_BN/moving_mean
?
Bblock_11_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_11_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_11_depthwise_BN/moving_mean/AssignAssignVariableOp!block_11_depthwise_BN/moving_mean3block_11_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_11_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_11_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*8
_class.
,*loc:@block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_11_depthwise_BN/moving_varianceVarHandleOp*8
_class.
,*loc:@block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*6
shared_name'%block_11_depthwise_BN/moving_variance
?
Fblock_11_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_11_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_11_depthwise_BN/moving_variance/AssignAssignVariableOp%block_11_depthwise_BN/moving_variance6block_11_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_11_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_11_depthwise_BN/ReadVariableOpReadVariableOpblock_11_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_11_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_11_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_11_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_11_depthwise/depthwise$block_11_depthwise_BN/ReadVariableOp&block_11_depthwise_BN/ReadVariableOp_15block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
`
block_11_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_11_depthwise_relu/Relu6Relu6&block_11_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
8block_11_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?       **
_class 
loc:@block_11_project/kernel*
dtype0*
_output_shapes
:
?
6block_11_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *b?'?**
_class 
loc:@block_11_project/kernel
?
6block_11_project/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *b?'>**
_class 
loc:@block_11_project/kernel
?
@block_11_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_11_project/kernel/Initializer/random_uniform/shape*
T0**
_class 
loc:@block_11_project/kernel*
dtype0*'
_output_shapes
:? 
?
6block_11_project/kernel/Initializer/random_uniform/subSub6block_11_project/kernel/Initializer/random_uniform/max6block_11_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0**
_class 
loc:@block_11_project/kernel
?
6block_11_project/kernel/Initializer/random_uniform/mulMul@block_11_project/kernel/Initializer/random_uniform/RandomUniform6block_11_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_11_project/kernel*'
_output_shapes
:? 
?
2block_11_project/kernel/Initializer/random_uniformAdd6block_11_project/kernel/Initializer/random_uniform/mul6block_11_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_11_project/kernel*'
_output_shapes
:? 
?
block_11_project/kernelVarHandleOp**
_class 
loc:@block_11_project/kernel*
dtype0*
_output_shapes
: *
shape:? *(
shared_nameblock_11_project/kernel

8block_11_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_project/kernel*
_output_shapes
: 
?
block_11_project/kernel/AssignAssignVariableOpblock_11_project/kernel2block_11_project/kernel/Initializer/random_uniform*
dtype0
?
+block_11_project/kernel/Read/ReadVariableOpReadVariableOpblock_11_project/kernel*
dtype0*'
_output_shapes
:? 
o
block_11_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
&block_11_project/Conv2D/ReadVariableOpReadVariableOpblock_11_project/kernel*
dtype0*'
_output_shapes
:? 
?
block_11_project/Conv2DConv2Dblock_11_depthwise_relu/Relu6&block_11_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:????????? 
?
*block_11_project_BN/gamma/Initializer/onesConst*
valueB *  ??*,
_class"
 loc:@block_11_project_BN/gamma*
dtype0*
_output_shapes
: 
?
block_11_project_BN/gammaVarHandleOp**
shared_nameblock_11_project_BN/gamma*,
_class"
 loc:@block_11_project_BN/gamma*
dtype0*
_output_shapes
: *
shape: 
?
:block_11_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_project_BN/gamma*
_output_shapes
: 
?
 block_11_project_BN/gamma/AssignAssignVariableOpblock_11_project_BN/gamma*block_11_project_BN/gamma/Initializer/ones*
dtype0
?
-block_11_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_11_project_BN/gamma*
dtype0*
_output_shapes
: 
?
*block_11_project_BN/beta/Initializer/zerosConst*
valueB *    *+
_class!
loc:@block_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
block_11_project_BN/betaVarHandleOp*
shape: *)
shared_nameblock_11_project_BN/beta*+
_class!
loc:@block_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
9block_11_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_project_BN/beta*
_output_shapes
: 
?
block_11_project_BN/beta/AssignAssignVariableOpblock_11_project_BN/beta*block_11_project_BN/beta/Initializer/zeros*
dtype0
?
,block_11_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
1block_11_project_BN/moving_mean/Initializer/zerosConst*
valueB *    *2
_class(
&$loc:@block_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
block_11_project_BN/moving_meanVarHandleOp*
shape: *0
shared_name!block_11_project_BN/moving_mean*2
_class(
&$loc:@block_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
@block_11_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_11_project_BN/moving_mean*
_output_shapes
: 
?
&block_11_project_BN/moving_mean/AssignAssignVariableOpblock_11_project_BN/moving_mean1block_11_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_11_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
4block_11_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
: *
valueB *  ??*6
_class,
*(loc:@block_11_project_BN/moving_variance
?
#block_11_project_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape: *4
shared_name%#block_11_project_BN/moving_variance*6
_class,
*(loc:@block_11_project_BN/moving_variance
?
Dblock_11_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_11_project_BN/moving_variance*
_output_shapes
: 
?
*block_11_project_BN/moving_variance/AssignAssignVariableOp#block_11_project_BN/moving_variance4block_11_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_11_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_11_project_BN/moving_variance*
dtype0*
_output_shapes
: 
x
"block_11_project_BN/ReadVariableOpReadVariableOpblock_11_project_BN/gamma*
dtype0*
_output_shapes
: 
y
$block_11_project_BN/ReadVariableOp_1ReadVariableOpblock_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
3block_11_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
5block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_11_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
$block_11_project_BN/FusedBatchNormV3FusedBatchNormV3block_11_project/Conv2D"block_11_project_BN/ReadVariableOp$block_11_project_BN/ReadVariableOp_13block_11_project_BN/FusedBatchNormV3/ReadVariableOp5block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( 
^
block_11_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_11_add/addAddV2$block_10_project_BN/FusedBatchNormV3$block_11_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:????????? 
?
7block_12_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"          ?   *)
_class
loc:@block_12_expand/kernel*
dtype0*
_output_shapes
:
?
5block_12_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *b?'?*)
_class
loc:@block_12_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_12_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b?'>*)
_class
loc:@block_12_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_12_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_12_expand/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_12_expand/kernel*
dtype0*'
_output_shapes
: ?
?
5block_12_expand/kernel/Initializer/random_uniform/subSub5block_12_expand/kernel/Initializer/random_uniform/max5block_12_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_12_expand/kernel*
_output_shapes
: 
?
5block_12_expand/kernel/Initializer/random_uniform/mulMul?block_12_expand/kernel/Initializer/random_uniform/RandomUniform5block_12_expand/kernel/Initializer/random_uniform/sub*'
_output_shapes
: ?*
T0*)
_class
loc:@block_12_expand/kernel
?
1block_12_expand/kernel/Initializer/random_uniformAdd5block_12_expand/kernel/Initializer/random_uniform/mul5block_12_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_12_expand/kernel*'
_output_shapes
: ?
?
block_12_expand/kernelVarHandleOp*
shape: ?*'
shared_nameblock_12_expand/kernel*)
_class
loc:@block_12_expand/kernel*
dtype0*
_output_shapes
: 
}
7block_12_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_expand/kernel*
_output_shapes
: 
?
block_12_expand/kernel/AssignAssignVariableOpblock_12_expand/kernel1block_12_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_12_expand/kernel/Read/ReadVariableOpReadVariableOpblock_12_expand/kernel*
dtype0*'
_output_shapes
: ?
n
block_12_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_12_expand/Conv2D/ReadVariableOpReadVariableOpblock_12_expand/kernel*
dtype0*'
_output_shapes
: ?
?
block_12_expand/Conv2DConv2Dblock_11_add/add%block_12_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
)block_12_expand_BN/gamma/Initializer/onesConst*
valueB?*  ??*+
_class!
loc:@block_12_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_12_expand_BN/gammaVarHandleOp*)
shared_nameblock_12_expand_BN/gamma*+
_class!
loc:@block_12_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
9block_12_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_expand_BN/gamma*
_output_shapes
: 
?
block_12_expand_BN/gamma/AssignAssignVariableOpblock_12_expand_BN/gamma)block_12_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_12_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_12_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_12_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_12_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_12_expand_BN/betaVarHandleOp*(
shared_nameblock_12_expand_BN/beta**
_class 
loc:@block_12_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:?

8block_12_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_expand_BN/beta*
_output_shapes
: 
?
block_12_expand_BN/beta/AssignAssignVariableOpblock_12_expand_BN/beta)block_12_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_12_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_12_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_12_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_12_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_12_expand_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*/
shared_name block_12_expand_BN/moving_mean*1
_class'
%#loc:@block_12_expand_BN/moving_mean
?
?block_12_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_expand_BN/moving_mean*
_output_shapes
: 
?
%block_12_expand_BN/moving_mean/AssignAssignVariableOpblock_12_expand_BN/moving_mean0block_12_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_12_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_12_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_12_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*5
_class+
)'loc:@block_12_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_12_expand_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_12_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*3
shared_name$"block_12_expand_BN/moving_variance
?
Cblock_12_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_12_expand_BN/moving_variance*
_output_shapes
: 
?
)block_12_expand_BN/moving_variance/AssignAssignVariableOp"block_12_expand_BN/moving_variance3block_12_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_12_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_12_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_12_expand_BN/ReadVariableOpReadVariableOpblock_12_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_12_expand_BN/ReadVariableOp_1ReadVariableOpblock_12_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_12_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_12_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_12_expand_BN/FusedBatchNormV3FusedBatchNormV3block_12_expand/Conv2D!block_12_expand_BN/ReadVariableOp#block_12_expand_BN/ReadVariableOp_12block_12_expand_BN/FusedBatchNormV3/ReadVariableOp4block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
]
block_12_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_12_expand_relu/Relu6Relu6#block_12_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
Dblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      *6
_class,
*(loc:@block_12_depthwise/depthwise_kernel
?
Bblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *??p?*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel
?
Bblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *??p=*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel
?
Lblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel*
_output_shapes
: 
?
Bblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_12_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_12_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel*'
_output_shapes
:?
?
#block_12_depthwise/depthwise_kernelVarHandleOp*
shape:?*4
shared_name%#block_12_depthwise/depthwise_kernel*6
_class,
*(loc:@block_12_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Dblock_12_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_12_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_12_depthwise/depthwise_kernel/AssignAssignVariableOp#block_12_depthwise/depthwise_kernel>block_12_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_12_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_12_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_12_depthwise/depthwise/ReadVariableOpReadVariableOp#block_12_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_12_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
{
*block_12_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
block_12_depthwise/depthwiseDepthwiseConv2dNativeblock_12_expand_relu/Relu6+block_12_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
,block_12_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*.
_class$
" loc:@block_12_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_12_depthwise_BN/gammaVarHandleOp*.
_class$
" loc:@block_12_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?*,
shared_nameblock_12_depthwise_BN/gamma
?
<block_12_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_depthwise_BN/gamma*
_output_shapes
: 
?
"block_12_depthwise_BN/gamma/AssignAssignVariableOpblock_12_depthwise_BN/gamma,block_12_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_12_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_12_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_12_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_12_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_12_depthwise_BN/betaVarHandleOp*+
shared_nameblock_12_depthwise_BN/beta*-
_class#
!loc:@block_12_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:?
?
;block_12_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_depthwise_BN/beta*
_output_shapes
: 
?
!block_12_depthwise_BN/beta/AssignAssignVariableOpblock_12_depthwise_BN/beta,block_12_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_12_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_12_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_12_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_12_depthwise_BN/moving_meanVarHandleOp*2
shared_name#!block_12_depthwise_BN/moving_mean*4
_class*
(&loc:@block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?
?
Bblock_12_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_12_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_12_depthwise_BN/moving_mean/AssignAssignVariableOp!block_12_depthwise_BN/moving_mean3block_12_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_12_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_12_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*8
_class.
,*loc:@block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_12_depthwise_BN/moving_varianceVarHandleOp*
shape:?*6
shared_name'%block_12_depthwise_BN/moving_variance*8
_class.
,*loc:@block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Fblock_12_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_12_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_12_depthwise_BN/moving_variance/AssignAssignVariableOp%block_12_depthwise_BN/moving_variance6block_12_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_12_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_12_depthwise_BN/ReadVariableOpReadVariableOpblock_12_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_12_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_12_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_12_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_12_depthwise/depthwise$block_12_depthwise_BN/ReadVariableOp&block_12_depthwise_BN/ReadVariableOp_15block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
`
block_12_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_12_depthwise_relu/Relu6Relu6&block_12_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
8block_12_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?       **
_class 
loc:@block_12_project/kernel*
dtype0*
_output_shapes
:
?
6block_12_project/kernel/Initializer/random_uniform/minConst*
valueB
 *b?'?**
_class 
loc:@block_12_project/kernel*
dtype0*
_output_shapes
: 
?
6block_12_project/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *b?'>**
_class 
loc:@block_12_project/kernel
?
@block_12_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_12_project/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:? *
T0**
_class 
loc:@block_12_project/kernel
?
6block_12_project/kernel/Initializer/random_uniform/subSub6block_12_project/kernel/Initializer/random_uniform/max6block_12_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_12_project/kernel*
_output_shapes
: 
?
6block_12_project/kernel/Initializer/random_uniform/mulMul@block_12_project/kernel/Initializer/random_uniform/RandomUniform6block_12_project/kernel/Initializer/random_uniform/sub*'
_output_shapes
:? *
T0**
_class 
loc:@block_12_project/kernel
?
2block_12_project/kernel/Initializer/random_uniformAdd6block_12_project/kernel/Initializer/random_uniform/mul6block_12_project/kernel/Initializer/random_uniform/min*'
_output_shapes
:? *
T0**
_class 
loc:@block_12_project/kernel
?
block_12_project/kernelVarHandleOp*(
shared_nameblock_12_project/kernel**
_class 
loc:@block_12_project/kernel*
dtype0*
_output_shapes
: *
shape:? 

8block_12_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_project/kernel*
_output_shapes
: 
?
block_12_project/kernel/AssignAssignVariableOpblock_12_project/kernel2block_12_project/kernel/Initializer/random_uniform*
dtype0
?
+block_12_project/kernel/Read/ReadVariableOpReadVariableOpblock_12_project/kernel*
dtype0*'
_output_shapes
:? 
o
block_12_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
&block_12_project/Conv2D/ReadVariableOpReadVariableOpblock_12_project/kernel*
dtype0*'
_output_shapes
:? 
?
block_12_project/Conv2DConv2Dblock_12_depthwise_relu/Relu6&block_12_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:????????? 
?
*block_12_project_BN/gamma/Initializer/onesConst*
valueB *  ??*,
_class"
 loc:@block_12_project_BN/gamma*
dtype0*
_output_shapes
: 
?
block_12_project_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape: **
shared_nameblock_12_project_BN/gamma*,
_class"
 loc:@block_12_project_BN/gamma
?
:block_12_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_project_BN/gamma*
_output_shapes
: 
?
 block_12_project_BN/gamma/AssignAssignVariableOpblock_12_project_BN/gamma*block_12_project_BN/gamma/Initializer/ones*
dtype0
?
-block_12_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_12_project_BN/gamma*
dtype0*
_output_shapes
: 
?
*block_12_project_BN/beta/Initializer/zerosConst*
valueB *    *+
_class!
loc:@block_12_project_BN/beta*
dtype0*
_output_shapes
: 
?
block_12_project_BN/betaVarHandleOp*+
_class!
loc:@block_12_project_BN/beta*
dtype0*
_output_shapes
: *
shape: *)
shared_nameblock_12_project_BN/beta
?
9block_12_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_project_BN/beta*
_output_shapes
: 
?
block_12_project_BN/beta/AssignAssignVariableOpblock_12_project_BN/beta*block_12_project_BN/beta/Initializer/zeros*
dtype0
?
,block_12_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_12_project_BN/beta*
dtype0*
_output_shapes
: 
?
1block_12_project_BN/moving_mean/Initializer/zerosConst*
valueB *    *2
_class(
&$loc:@block_12_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
block_12_project_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape: *0
shared_name!block_12_project_BN/moving_mean*2
_class(
&$loc:@block_12_project_BN/moving_mean
?
@block_12_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_12_project_BN/moving_mean*
_output_shapes
: 
?
&block_12_project_BN/moving_mean/AssignAssignVariableOpblock_12_project_BN/moving_mean1block_12_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_12_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_12_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
4block_12_project_BN/moving_variance/Initializer/onesConst*
valueB *  ??*6
_class,
*(loc:@block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
#block_12_project_BN/moving_varianceVarHandleOp*
shape: *4
shared_name%#block_12_project_BN/moving_variance*6
_class,
*(loc:@block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Dblock_12_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_12_project_BN/moving_variance*
_output_shapes
: 
?
*block_12_project_BN/moving_variance/AssignAssignVariableOp#block_12_project_BN/moving_variance4block_12_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_12_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
x
"block_12_project_BN/ReadVariableOpReadVariableOpblock_12_project_BN/gamma*
dtype0*
_output_shapes
: 
y
$block_12_project_BN/ReadVariableOp_1ReadVariableOpblock_12_project_BN/beta*
dtype0*
_output_shapes
: 
?
3block_12_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
5block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
$block_12_project_BN/FusedBatchNormV3FusedBatchNormV3block_12_project/Conv2D"block_12_project_BN/ReadVariableOp$block_12_project_BN/ReadVariableOp_13block_12_project_BN/FusedBatchNormV3/ReadVariableOp5block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( *
epsilon%o?:
^
block_12_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_12_add/addAddV2block_11_add/add$block_12_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:????????? 
?
7block_13_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"          ?   *)
_class
loc:@block_13_expand/kernel
?
5block_13_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *b?'?*)
_class
loc:@block_13_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_13_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *b?'>*)
_class
loc:@block_13_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_13_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_13_expand/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_13_expand/kernel*
dtype0*'
_output_shapes
: ?
?
5block_13_expand/kernel/Initializer/random_uniform/subSub5block_13_expand/kernel/Initializer/random_uniform/max5block_13_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_13_expand/kernel*
_output_shapes
: 
?
5block_13_expand/kernel/Initializer/random_uniform/mulMul?block_13_expand/kernel/Initializer/random_uniform/RandomUniform5block_13_expand/kernel/Initializer/random_uniform/sub*'
_output_shapes
: ?*
T0*)
_class
loc:@block_13_expand/kernel
?
1block_13_expand/kernel/Initializer/random_uniformAdd5block_13_expand/kernel/Initializer/random_uniform/mul5block_13_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_13_expand/kernel*'
_output_shapes
: ?
?
block_13_expand/kernelVarHandleOp*
shape: ?*'
shared_nameblock_13_expand/kernel*)
_class
loc:@block_13_expand/kernel*
dtype0*
_output_shapes
: 
}
7block_13_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_expand/kernel*
_output_shapes
: 
?
block_13_expand/kernel/AssignAssignVariableOpblock_13_expand/kernel1block_13_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_13_expand/kernel/Read/ReadVariableOpReadVariableOpblock_13_expand/kernel*
dtype0*'
_output_shapes
: ?
n
block_13_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_13_expand/Conv2D/ReadVariableOpReadVariableOpblock_13_expand/kernel*
dtype0*'
_output_shapes
: ?
?
block_13_expand/Conv2DConv2Dblock_12_add/add%block_13_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
)block_13_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*+
_class!
loc:@block_13_expand_BN/gamma
?
block_13_expand_BN/gammaVarHandleOp*+
_class!
loc:@block_13_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:?*)
shared_nameblock_13_expand_BN/gamma
?
9block_13_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_expand_BN/gamma*
_output_shapes
: 
?
block_13_expand_BN/gamma/AssignAssignVariableOpblock_13_expand_BN/gamma)block_13_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_13_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_13_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_13_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_13_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_13_expand_BN/betaVarHandleOp*(
shared_nameblock_13_expand_BN/beta**
_class 
loc:@block_13_expand_BN/beta*
dtype0*
_output_shapes
: *
shape:?

8block_13_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_expand_BN/beta*
_output_shapes
: 
?
block_13_expand_BN/beta/AssignAssignVariableOpblock_13_expand_BN/beta)block_13_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_13_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_13_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_13_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_13_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_13_expand_BN/moving_meanVarHandleOp*/
shared_name block_13_expand_BN/moving_mean*1
_class'
%#loc:@block_13_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?
?
?block_13_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_expand_BN/moving_mean*
_output_shapes
: 
?
%block_13_expand_BN/moving_mean/AssignAssignVariableOpblock_13_expand_BN/moving_mean0block_13_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_13_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_13_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_13_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*5
_class+
)'loc:@block_13_expand_BN/moving_variance
?
"block_13_expand_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_13_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*3
shared_name$"block_13_expand_BN/moving_variance
?
Cblock_13_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_13_expand_BN/moving_variance*
_output_shapes
: 
?
)block_13_expand_BN/moving_variance/AssignAssignVariableOp"block_13_expand_BN/moving_variance3block_13_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_13_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_13_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_13_expand_BN/ReadVariableOpReadVariableOpblock_13_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_13_expand_BN/ReadVariableOp_1ReadVariableOpblock_13_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_13_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_13_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_13_expand_BN/FusedBatchNormV3FusedBatchNormV3block_13_expand/Conv2D!block_13_expand_BN/ReadVariableOp#block_13_expand_BN/ReadVariableOp_12block_13_expand_BN/FusedBatchNormV3/ReadVariableOp4block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
]
block_13_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_13_expand_relu/Relu6Relu6#block_13_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
block_13_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
block_13_pad/PadPadblock_13_expand_relu/Relu6block_13_pad/Pad/paddings*0
_output_shapes
:??????????*
T0
?
Dblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      ?      *6
_class,
*(loc:@block_13_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *??p?*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Bblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *??p=*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel
?
Lblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel
?
Bblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/sub*'
_output_shapes
:?*
T0*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel
?
>block_13_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_13_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel*'
_output_shapes
:?
?
#block_13_depthwise/depthwise_kernelVarHandleOp*4
shared_name%#block_13_depthwise/depthwise_kernel*6
_class,
*(loc:@block_13_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: *
shape:?
?
Dblock_13_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_13_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_13_depthwise/depthwise_kernel/AssignAssignVariableOp#block_13_depthwise/depthwise_kernel>block_13_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_13_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_13_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_13_depthwise/depthwise/ReadVariableOpReadVariableOp#block_13_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_13_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
{
*block_13_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_13_depthwise/depthwiseDepthwiseConv2dNativeblock_13_pad/Pad+block_13_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*0
_output_shapes
:??????????
?
,block_13_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*.
_class$
" loc:@block_13_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_13_depthwise_BN/gammaVarHandleOp*,
shared_nameblock_13_depthwise_BN/gamma*.
_class$
" loc:@block_13_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
<block_13_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_depthwise_BN/gamma*
_output_shapes
: 
?
"block_13_depthwise_BN/gamma/AssignAssignVariableOpblock_13_depthwise_BN/gamma,block_13_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_13_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_13_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_13_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_13_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_13_depthwise_BN/betaVarHandleOp*-
_class#
!loc:@block_13_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:?*+
shared_nameblock_13_depthwise_BN/beta
?
;block_13_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_depthwise_BN/beta*
_output_shapes
: 
?
!block_13_depthwise_BN/beta/AssignAssignVariableOpblock_13_depthwise_BN/beta,block_13_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_13_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_13_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_13_depthwise_BN/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *4
_class*
(&loc:@block_13_depthwise_BN/moving_mean
?
!block_13_depthwise_BN/moving_meanVarHandleOp*4
_class*
(&loc:@block_13_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_13_depthwise_BN/moving_mean
?
Bblock_13_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_13_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_13_depthwise_BN/moving_mean/AssignAssignVariableOp!block_13_depthwise_BN/moving_mean3block_13_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_13_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_13_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_13_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*8
_class.
,*loc:@block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_13_depthwise_BN/moving_varianceVarHandleOp*
shape:?*6
shared_name'%block_13_depthwise_BN/moving_variance*8
_class.
,*loc:@block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Fblock_13_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_13_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_13_depthwise_BN/moving_variance/AssignAssignVariableOp%block_13_depthwise_BN/moving_variance6block_13_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_13_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_13_depthwise_BN/ReadVariableOpReadVariableOpblock_13_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_13_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_13_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_13_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_13_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_13_depthwise/depthwise$block_13_depthwise_BN/ReadVariableOp&block_13_depthwise_BN/ReadVariableOp_15block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
`
block_13_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_13_depthwise_relu/Relu6Relu6&block_13_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
8block_13_project/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?   8   **
_class 
loc:@block_13_project/kernel
?
6block_13_project/kernel/Initializer/random_uniform/minConst*
valueB
 *?F?**
_class 
loc:@block_13_project/kernel*
dtype0*
_output_shapes
: 
?
6block_13_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?F>**
_class 
loc:@block_13_project/kernel*
dtype0*
_output_shapes
: 
?
@block_13_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_13_project/kernel/Initializer/random_uniform/shape*
T0**
_class 
loc:@block_13_project/kernel*
dtype0*'
_output_shapes
:?8
?
6block_13_project/kernel/Initializer/random_uniform/subSub6block_13_project/kernel/Initializer/random_uniform/max6block_13_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0**
_class 
loc:@block_13_project/kernel
?
6block_13_project/kernel/Initializer/random_uniform/mulMul@block_13_project/kernel/Initializer/random_uniform/RandomUniform6block_13_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_13_project/kernel*'
_output_shapes
:?8
?
2block_13_project/kernel/Initializer/random_uniformAdd6block_13_project/kernel/Initializer/random_uniform/mul6block_13_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_13_project/kernel*'
_output_shapes
:?8
?
block_13_project/kernelVarHandleOp*(
shared_nameblock_13_project/kernel**
_class 
loc:@block_13_project/kernel*
dtype0*
_output_shapes
: *
shape:?8

8block_13_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_project/kernel*
_output_shapes
: 
?
block_13_project/kernel/AssignAssignVariableOpblock_13_project/kernel2block_13_project/kernel/Initializer/random_uniform*
dtype0
?
+block_13_project/kernel/Read/ReadVariableOpReadVariableOpblock_13_project/kernel*
dtype0*'
_output_shapes
:?8
o
block_13_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
&block_13_project/Conv2D/ReadVariableOpReadVariableOpblock_13_project/kernel*
dtype0*'
_output_shapes
:?8
?
block_13_project/Conv2DConv2Dblock_13_depthwise_relu/Relu6&block_13_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????8*
paddingSAME*
T0
?
*block_13_project_BN/gamma/Initializer/onesConst*
valueB8*  ??*,
_class"
 loc:@block_13_project_BN/gamma*
dtype0*
_output_shapes
:8
?
block_13_project_BN/gammaVarHandleOp*,
_class"
 loc:@block_13_project_BN/gamma*
dtype0*
_output_shapes
: *
shape:8**
shared_nameblock_13_project_BN/gamma
?
:block_13_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_project_BN/gamma*
_output_shapes
: 
?
 block_13_project_BN/gamma/AssignAssignVariableOpblock_13_project_BN/gamma*block_13_project_BN/gamma/Initializer/ones*
dtype0
?
-block_13_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_13_project_BN/gamma*
dtype0*
_output_shapes
:8
?
*block_13_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:8*
valueB8*    *+
_class!
loc:@block_13_project_BN/beta
?
block_13_project_BN/betaVarHandleOp*+
_class!
loc:@block_13_project_BN/beta*
dtype0*
_output_shapes
: *
shape:8*)
shared_nameblock_13_project_BN/beta
?
9block_13_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_project_BN/beta*
_output_shapes
: 
?
block_13_project_BN/beta/AssignAssignVariableOpblock_13_project_BN/beta*block_13_project_BN/beta/Initializer/zeros*
dtype0
?
,block_13_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_13_project_BN/beta*
dtype0*
_output_shapes
:8
?
1block_13_project_BN/moving_mean/Initializer/zerosConst*
valueB8*    *2
_class(
&$loc:@block_13_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
block_13_project_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:8*0
shared_name!block_13_project_BN/moving_mean*2
_class(
&$loc:@block_13_project_BN/moving_mean
?
@block_13_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_13_project_BN/moving_mean*
_output_shapes
: 
?
&block_13_project_BN/moving_mean/AssignAssignVariableOpblock_13_project_BN/moving_mean1block_13_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_13_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_13_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
4block_13_project_BN/moving_variance/Initializer/onesConst*
valueB8*  ??*6
_class,
*(loc:@block_13_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
#block_13_project_BN/moving_varianceVarHandleOp*6
_class,
*(loc:@block_13_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:8*4
shared_name%#block_13_project_BN/moving_variance
?
Dblock_13_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_13_project_BN/moving_variance*
_output_shapes
: 
?
*block_13_project_BN/moving_variance/AssignAssignVariableOp#block_13_project_BN/moving_variance4block_13_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_13_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_13_project_BN/moving_variance*
dtype0*
_output_shapes
:8
x
"block_13_project_BN/ReadVariableOpReadVariableOpblock_13_project_BN/gamma*
dtype0*
_output_shapes
:8
y
$block_13_project_BN/ReadVariableOp_1ReadVariableOpblock_13_project_BN/beta*
dtype0*
_output_shapes
:8
?
3block_13_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
5block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_13_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
$block_13_project_BN/FusedBatchNormV3FusedBatchNormV3block_13_project/Conv2D"block_13_project_BN/ReadVariableOp$block_13_project_BN/ReadVariableOp_13block_13_project_BN/FusedBatchNormV3/ReadVariableOp5block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????8:8:8:8:8:
^
block_13_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
7block_14_expand/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      8   P  *)
_class
loc:@block_14_expand/kernel
?
5block_14_expand/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *?_??*)
_class
loc:@block_14_expand/kernel
?
5block_14_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?_?=*)
_class
loc:@block_14_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_14_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_14_expand/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_14_expand/kernel*
dtype0*'
_output_shapes
:8?
?
5block_14_expand/kernel/Initializer/random_uniform/subSub5block_14_expand/kernel/Initializer/random_uniform/max5block_14_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_14_expand/kernel*
_output_shapes
: 
?
5block_14_expand/kernel/Initializer/random_uniform/mulMul?block_14_expand/kernel/Initializer/random_uniform/RandomUniform5block_14_expand/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_14_expand/kernel*'
_output_shapes
:8?
?
1block_14_expand/kernel/Initializer/random_uniformAdd5block_14_expand/kernel/Initializer/random_uniform/mul5block_14_expand/kernel/Initializer/random_uniform/min*'
_output_shapes
:8?*
T0*)
_class
loc:@block_14_expand/kernel
?
block_14_expand/kernelVarHandleOp*
shape:8?*'
shared_nameblock_14_expand/kernel*)
_class
loc:@block_14_expand/kernel*
dtype0*
_output_shapes
: 
}
7block_14_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_expand/kernel*
_output_shapes
: 
?
block_14_expand/kernel/AssignAssignVariableOpblock_14_expand/kernel1block_14_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_14_expand/kernel/Read/ReadVariableOpReadVariableOpblock_14_expand/kernel*
dtype0*'
_output_shapes
:8?
n
block_14_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_14_expand/Conv2D/ReadVariableOpReadVariableOpblock_14_expand/kernel*
dtype0*'
_output_shapes
:8?
?
block_14_expand/Conv2DConv2D$block_13_project_BN/FusedBatchNormV3%block_14_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
)block_14_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*+
_class!
loc:@block_14_expand_BN/gamma
?
block_14_expand_BN/gammaVarHandleOp*
shape:?*)
shared_nameblock_14_expand_BN/gamma*+
_class!
loc:@block_14_expand_BN/gamma*
dtype0*
_output_shapes
: 
?
9block_14_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_expand_BN/gamma*
_output_shapes
: 
?
block_14_expand_BN/gamma/AssignAssignVariableOpblock_14_expand_BN/gamma)block_14_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_14_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_14_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_14_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_14_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_14_expand_BN/betaVarHandleOp*
shape:?*(
shared_nameblock_14_expand_BN/beta**
_class 
loc:@block_14_expand_BN/beta*
dtype0*
_output_shapes
: 

8block_14_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_expand_BN/beta*
_output_shapes
: 
?
block_14_expand_BN/beta/AssignAssignVariableOpblock_14_expand_BN/beta)block_14_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_14_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_14_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_14_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_14_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_14_expand_BN/moving_meanVarHandleOp*
shape:?*/
shared_name block_14_expand_BN/moving_mean*1
_class'
%#loc:@block_14_expand_BN/moving_mean*
dtype0*
_output_shapes
: 
?
?block_14_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_expand_BN/moving_mean*
_output_shapes
: 
?
%block_14_expand_BN/moving_mean/AssignAssignVariableOpblock_14_expand_BN/moving_mean0block_14_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_14_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_14_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_14_expand_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*5
_class+
)'loc:@block_14_expand_BN/moving_variance
?
"block_14_expand_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_14_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*3
shared_name$"block_14_expand_BN/moving_variance
?
Cblock_14_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_14_expand_BN/moving_variance*
_output_shapes
: 
?
)block_14_expand_BN/moving_variance/AssignAssignVariableOp"block_14_expand_BN/moving_variance3block_14_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_14_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_14_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_14_expand_BN/ReadVariableOpReadVariableOpblock_14_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_14_expand_BN/ReadVariableOp_1ReadVariableOpblock_14_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_14_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_14_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_14_expand_BN/FusedBatchNormV3FusedBatchNormV3block_14_expand/Conv2D!block_14_expand_BN/ReadVariableOp#block_14_expand_BN/ReadVariableOp_12block_14_expand_BN/FusedBatchNormV3/ReadVariableOp4block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
]
block_14_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_14_expand_relu/Relu6Relu6#block_14_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Dblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      P     *6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *?-6?*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Bblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *?-6=*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Lblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
_output_shapes
: 
?
Bblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_14_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_14_depthwise/depthwise_kernel/Initializer/random_uniform/min*'
_output_shapes
:?*
T0*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel
?
#block_14_depthwise/depthwise_kernelVarHandleOp*
shape:?*4
shared_name%#block_14_depthwise/depthwise_kernel*6
_class,
*(loc:@block_14_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Dblock_14_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_14_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_14_depthwise/depthwise_kernel/AssignAssignVariableOp#block_14_depthwise/depthwise_kernel>block_14_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_14_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_14_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_14_depthwise/depthwise/ReadVariableOpReadVariableOp#block_14_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_14_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      P     
{
*block_14_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_14_depthwise/depthwiseDepthwiseConv2dNativeblock_14_expand_relu/Relu6+block_14_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
,block_14_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*.
_class$
" loc:@block_14_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_14_depthwise_BN/gammaVarHandleOp*,
shared_nameblock_14_depthwise_BN/gamma*.
_class$
" loc:@block_14_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
<block_14_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_depthwise_BN/gamma*
_output_shapes
: 
?
"block_14_depthwise_BN/gamma/AssignAssignVariableOpblock_14_depthwise_BN/gamma,block_14_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_14_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_14_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_14_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_14_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_14_depthwise_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*+
shared_nameblock_14_depthwise_BN/beta*-
_class#
!loc:@block_14_depthwise_BN/beta
?
;block_14_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_depthwise_BN/beta*
_output_shapes
: 
?
!block_14_depthwise_BN/beta/AssignAssignVariableOpblock_14_depthwise_BN/beta,block_14_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_14_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_14_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_14_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_14_depthwise_BN/moving_meanVarHandleOp*4
_class*
(&loc:@block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_14_depthwise_BN/moving_mean
?
Bblock_14_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_14_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_14_depthwise_BN/moving_mean/AssignAssignVariableOp!block_14_depthwise_BN/moving_mean3block_14_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_14_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_14_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*8
_class.
,*loc:@block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_14_depthwise_BN/moving_varianceVarHandleOp*8
_class.
,*loc:@block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*6
shared_name'%block_14_depthwise_BN/moving_variance
?
Fblock_14_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_14_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_14_depthwise_BN/moving_variance/AssignAssignVariableOp%block_14_depthwise_BN/moving_variance6block_14_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_14_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_14_depthwise_BN/ReadVariableOpReadVariableOpblock_14_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_14_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_14_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_14_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_14_depthwise/depthwise$block_14_depthwise_BN/ReadVariableOp&block_14_depthwise_BN/ReadVariableOp_15block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
`
block_14_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_14_depthwise_relu/Relu6Relu6&block_14_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
8block_14_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      P  8   **
_class 
loc:@block_14_project/kernel*
dtype0*
_output_shapes
:
?
6block_14_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *?_??**
_class 
loc:@block_14_project/kernel
?
6block_14_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?_?=**
_class 
loc:@block_14_project/kernel*
dtype0*
_output_shapes
: 
?
@block_14_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_14_project/kernel/Initializer/random_uniform/shape*
T0**
_class 
loc:@block_14_project/kernel*
dtype0*'
_output_shapes
:?8
?
6block_14_project/kernel/Initializer/random_uniform/subSub6block_14_project/kernel/Initializer/random_uniform/max6block_14_project/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0**
_class 
loc:@block_14_project/kernel
?
6block_14_project/kernel/Initializer/random_uniform/mulMul@block_14_project/kernel/Initializer/random_uniform/RandomUniform6block_14_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_14_project/kernel*'
_output_shapes
:?8
?
2block_14_project/kernel/Initializer/random_uniformAdd6block_14_project/kernel/Initializer/random_uniform/mul6block_14_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_14_project/kernel*'
_output_shapes
:?8
?
block_14_project/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?8*(
shared_nameblock_14_project/kernel**
_class 
loc:@block_14_project/kernel

8block_14_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_project/kernel*
_output_shapes
: 
?
block_14_project/kernel/AssignAssignVariableOpblock_14_project/kernel2block_14_project/kernel/Initializer/random_uniform*
dtype0
?
+block_14_project/kernel/Read/ReadVariableOpReadVariableOpblock_14_project/kernel*
dtype0*'
_output_shapes
:?8
o
block_14_project/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
&block_14_project/Conv2D/ReadVariableOpReadVariableOpblock_14_project/kernel*
dtype0*'
_output_shapes
:?8
?
block_14_project/Conv2DConv2Dblock_14_depthwise_relu/Relu6&block_14_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????8
?
*block_14_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:8*
valueB8*  ??*,
_class"
 loc:@block_14_project_BN/gamma
?
block_14_project_BN/gammaVarHandleOp*
shape:8**
shared_nameblock_14_project_BN/gamma*,
_class"
 loc:@block_14_project_BN/gamma*
dtype0*
_output_shapes
: 
?
:block_14_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_project_BN/gamma*
_output_shapes
: 
?
 block_14_project_BN/gamma/AssignAssignVariableOpblock_14_project_BN/gamma*block_14_project_BN/gamma/Initializer/ones*
dtype0
?
-block_14_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_14_project_BN/gamma*
dtype0*
_output_shapes
:8
?
*block_14_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:8*
valueB8*    *+
_class!
loc:@block_14_project_BN/beta
?
block_14_project_BN/betaVarHandleOp*+
_class!
loc:@block_14_project_BN/beta*
dtype0*
_output_shapes
: *
shape:8*)
shared_nameblock_14_project_BN/beta
?
9block_14_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_project_BN/beta*
_output_shapes
: 
?
block_14_project_BN/beta/AssignAssignVariableOpblock_14_project_BN/beta*block_14_project_BN/beta/Initializer/zeros*
dtype0
?
,block_14_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_14_project_BN/beta*
dtype0*
_output_shapes
:8
?
1block_14_project_BN/moving_mean/Initializer/zerosConst*
valueB8*    *2
_class(
&$loc:@block_14_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
block_14_project_BN/moving_meanVarHandleOp*0
shared_name!block_14_project_BN/moving_mean*2
_class(
&$loc:@block_14_project_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:8
?
@block_14_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_14_project_BN/moving_mean*
_output_shapes
: 
?
&block_14_project_BN/moving_mean/AssignAssignVariableOpblock_14_project_BN/moving_mean1block_14_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_14_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_14_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
4block_14_project_BN/moving_variance/Initializer/onesConst*
valueB8*  ??*6
_class,
*(loc:@block_14_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
#block_14_project_BN/moving_varianceVarHandleOp*6
_class,
*(loc:@block_14_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:8*4
shared_name%#block_14_project_BN/moving_variance
?
Dblock_14_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_14_project_BN/moving_variance*
_output_shapes
: 
?
*block_14_project_BN/moving_variance/AssignAssignVariableOp#block_14_project_BN/moving_variance4block_14_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_14_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_14_project_BN/moving_variance*
dtype0*
_output_shapes
:8
x
"block_14_project_BN/ReadVariableOpReadVariableOpblock_14_project_BN/gamma*
dtype0*
_output_shapes
:8
y
$block_14_project_BN/ReadVariableOp_1ReadVariableOpblock_14_project_BN/beta*
dtype0*
_output_shapes
:8
?
3block_14_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
5block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_14_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
$block_14_project_BN/FusedBatchNormV3FusedBatchNormV3block_14_project/Conv2D"block_14_project_BN/ReadVariableOp$block_14_project_BN/ReadVariableOp_13block_14_project_BN/FusedBatchNormV3/ReadVariableOp5block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????8:8:8:8:8:*
is_training( *
epsilon%o?:*
T0*
U0
^
block_14_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_14_add/addAddV2$block_13_project_BN/FusedBatchNormV3$block_14_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????8*
T0
?
7block_15_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"      8   P  *)
_class
loc:@block_15_expand/kernel*
dtype0*
_output_shapes
:
?
5block_15_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *?_??*)
_class
loc:@block_15_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_15_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?_?=*)
_class
loc:@block_15_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_15_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_15_expand/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:8?*
T0*)
_class
loc:@block_15_expand/kernel
?
5block_15_expand/kernel/Initializer/random_uniform/subSub5block_15_expand/kernel/Initializer/random_uniform/max5block_15_expand/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_15_expand/kernel
?
5block_15_expand/kernel/Initializer/random_uniform/mulMul?block_15_expand/kernel/Initializer/random_uniform/RandomUniform5block_15_expand/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_15_expand/kernel*'
_output_shapes
:8?
?
1block_15_expand/kernel/Initializer/random_uniformAdd5block_15_expand/kernel/Initializer/random_uniform/mul5block_15_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_15_expand/kernel*'
_output_shapes
:8?
?
block_15_expand/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:8?*'
shared_nameblock_15_expand/kernel*)
_class
loc:@block_15_expand/kernel
}
7block_15_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_expand/kernel*
_output_shapes
: 
?
block_15_expand/kernel/AssignAssignVariableOpblock_15_expand/kernel1block_15_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_15_expand/kernel/Read/ReadVariableOpReadVariableOpblock_15_expand/kernel*
dtype0*'
_output_shapes
:8?
n
block_15_expand/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
%block_15_expand/Conv2D/ReadVariableOpReadVariableOpblock_15_expand/kernel*
dtype0*'
_output_shapes
:8?
?
block_15_expand/Conv2DConv2Dblock_14_add/add%block_15_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
)block_15_expand_BN/gamma/Initializer/onesConst*
valueB?*  ??*+
_class!
loc:@block_15_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_15_expand_BN/gammaVarHandleOp*+
_class!
loc:@block_15_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:?*)
shared_nameblock_15_expand_BN/gamma
?
9block_15_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_expand_BN/gamma*
_output_shapes
: 
?
block_15_expand_BN/gamma/AssignAssignVariableOpblock_15_expand_BN/gamma)block_15_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_15_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_15_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_15_expand_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    **
_class 
loc:@block_15_expand_BN/beta
?
block_15_expand_BN/betaVarHandleOp*
shape:?*(
shared_nameblock_15_expand_BN/beta**
_class 
loc:@block_15_expand_BN/beta*
dtype0*
_output_shapes
: 

8block_15_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_expand_BN/beta*
_output_shapes
: 
?
block_15_expand_BN/beta/AssignAssignVariableOpblock_15_expand_BN/beta)block_15_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_15_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_15_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_15_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_15_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_15_expand_BN/moving_meanVarHandleOp*/
shared_name block_15_expand_BN/moving_mean*1
_class'
%#loc:@block_15_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?
?
?block_15_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_expand_BN/moving_mean*
_output_shapes
: 
?
%block_15_expand_BN/moving_mean/AssignAssignVariableOpblock_15_expand_BN/moving_mean0block_15_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_15_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_15_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_15_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*5
_class+
)'loc:@block_15_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_15_expand_BN/moving_varianceVarHandleOp*
shape:?*3
shared_name$"block_15_expand_BN/moving_variance*5
_class+
)'loc:@block_15_expand_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Cblock_15_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_15_expand_BN/moving_variance*
_output_shapes
: 
?
)block_15_expand_BN/moving_variance/AssignAssignVariableOp"block_15_expand_BN/moving_variance3block_15_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_15_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_15_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_15_expand_BN/ReadVariableOpReadVariableOpblock_15_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_15_expand_BN/ReadVariableOp_1ReadVariableOpblock_15_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_15_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_15_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_15_expand_BN/FusedBatchNormV3FusedBatchNormV3block_15_expand/Conv2D!block_15_expand_BN/ReadVariableOp#block_15_expand_BN/ReadVariableOp_12block_15_expand_BN/FusedBatchNormV3/ReadVariableOp4block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
]
block_15_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_15_expand_relu/Relu6Relu6#block_15_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Dblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      P     *6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
valueB
 *?-6?*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Bblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
valueB
 *?-6=*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*
dtype0*
_output_shapes
: 
?
Lblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*
_output_shapes
: 
?
Bblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_15_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_15_depthwise/depthwise_kernel/Initializer/random_uniform/min*'
_output_shapes
:?*
T0*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel
?
#block_15_depthwise/depthwise_kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*4
shared_name%#block_15_depthwise/depthwise_kernel*6
_class,
*(loc:@block_15_depthwise/depthwise_kernel
?
Dblock_15_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_15_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_15_depthwise/depthwise_kernel/AssignAssignVariableOp#block_15_depthwise/depthwise_kernel>block_15_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_15_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_15_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_15_depthwise/depthwise/ReadVariableOpReadVariableOp#block_15_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_15_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
{
*block_15_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
block_15_depthwise/depthwiseDepthwiseConv2dNativeblock_15_expand_relu/Relu6+block_15_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
,block_15_depthwise_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*.
_class$
" loc:@block_15_depthwise_BN/gamma
?
block_15_depthwise_BN/gammaVarHandleOp*.
_class$
" loc:@block_15_depthwise_BN/gamma*
dtype0*
_output_shapes
: *
shape:?*,
shared_nameblock_15_depthwise_BN/gamma
?
<block_15_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_depthwise_BN/gamma*
_output_shapes
: 
?
"block_15_depthwise_BN/gamma/AssignAssignVariableOpblock_15_depthwise_BN/gamma,block_15_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_15_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_15_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_15_depthwise_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*
valueB?*    *-
_class#
!loc:@block_15_depthwise_BN/beta
?
block_15_depthwise_BN/betaVarHandleOp*-
_class#
!loc:@block_15_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:?*+
shared_nameblock_15_depthwise_BN/beta
?
;block_15_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_depthwise_BN/beta*
_output_shapes
: 
?
!block_15_depthwise_BN/beta/AssignAssignVariableOpblock_15_depthwise_BN/beta,block_15_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_15_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_15_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_15_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_15_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_15_depthwise_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_15_depthwise_BN/moving_mean*4
_class*
(&loc:@block_15_depthwise_BN/moving_mean
?
Bblock_15_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_15_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_15_depthwise_BN/moving_mean/AssignAssignVariableOp!block_15_depthwise_BN/moving_mean3block_15_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_15_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_15_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_15_depthwise_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*8
_class.
,*loc:@block_15_depthwise_BN/moving_variance
?
%block_15_depthwise_BN/moving_varianceVarHandleOp*6
shared_name'%block_15_depthwise_BN/moving_variance*8
_class.
,*loc:@block_15_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?
?
Fblock_15_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_15_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_15_depthwise_BN/moving_variance/AssignAssignVariableOp%block_15_depthwise_BN/moving_variance6block_15_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_15_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_15_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_15_depthwise_BN/ReadVariableOpReadVariableOpblock_15_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_15_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_15_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_15_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_15_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_15_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_15_depthwise/depthwise$block_15_depthwise_BN/ReadVariableOp&block_15_depthwise_BN/ReadVariableOp_15block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
`
block_15_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_15_depthwise_relu/Relu6Relu6&block_15_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
8block_15_project/kernel/Initializer/random_uniform/shapeConst*%
valueB"      P  8   **
_class 
loc:@block_15_project/kernel*
dtype0*
_output_shapes
:
?
6block_15_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *?_??**
_class 
loc:@block_15_project/kernel
?
6block_15_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *?_?=**
_class 
loc:@block_15_project/kernel*
dtype0*
_output_shapes
: 
?
@block_15_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_15_project/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:?8*
T0**
_class 
loc:@block_15_project/kernel
?
6block_15_project/kernel/Initializer/random_uniform/subSub6block_15_project/kernel/Initializer/random_uniform/max6block_15_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_15_project/kernel*
_output_shapes
: 
?
6block_15_project/kernel/Initializer/random_uniform/mulMul@block_15_project/kernel/Initializer/random_uniform/RandomUniform6block_15_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_15_project/kernel*'
_output_shapes
:?8
?
2block_15_project/kernel/Initializer/random_uniformAdd6block_15_project/kernel/Initializer/random_uniform/mul6block_15_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_15_project/kernel*'
_output_shapes
:?8
?
block_15_project/kernelVarHandleOp**
_class 
loc:@block_15_project/kernel*
dtype0*
_output_shapes
: *
shape:?8*(
shared_nameblock_15_project/kernel

8block_15_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_project/kernel*
_output_shapes
: 
?
block_15_project/kernel/AssignAssignVariableOpblock_15_project/kernel2block_15_project/kernel/Initializer/random_uniform*
dtype0
?
+block_15_project/kernel/Read/ReadVariableOpReadVariableOpblock_15_project/kernel*
dtype0*'
_output_shapes
:?8
o
block_15_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
&block_15_project/Conv2D/ReadVariableOpReadVariableOpblock_15_project/kernel*
dtype0*'
_output_shapes
:?8
?
block_15_project/Conv2DConv2Dblock_15_depthwise_relu/Relu6&block_15_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????8*
paddingSAME*
T0
?
*block_15_project_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:8*
valueB8*  ??*,
_class"
 loc:@block_15_project_BN/gamma
?
block_15_project_BN/gammaVarHandleOp*
shape:8**
shared_nameblock_15_project_BN/gamma*,
_class"
 loc:@block_15_project_BN/gamma*
dtype0*
_output_shapes
: 
?
:block_15_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_project_BN/gamma*
_output_shapes
: 
?
 block_15_project_BN/gamma/AssignAssignVariableOpblock_15_project_BN/gamma*block_15_project_BN/gamma/Initializer/ones*
dtype0
?
-block_15_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_15_project_BN/gamma*
dtype0*
_output_shapes
:8
?
*block_15_project_BN/beta/Initializer/zerosConst*
valueB8*    *+
_class!
loc:@block_15_project_BN/beta*
dtype0*
_output_shapes
:8
?
block_15_project_BN/betaVarHandleOp*+
_class!
loc:@block_15_project_BN/beta*
dtype0*
_output_shapes
: *
shape:8*)
shared_nameblock_15_project_BN/beta
?
9block_15_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_project_BN/beta*
_output_shapes
: 
?
block_15_project_BN/beta/AssignAssignVariableOpblock_15_project_BN/beta*block_15_project_BN/beta/Initializer/zeros*
dtype0
?
,block_15_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_15_project_BN/beta*
dtype0*
_output_shapes
:8
?
1block_15_project_BN/moving_mean/Initializer/zerosConst*
valueB8*    *2
_class(
&$loc:@block_15_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
block_15_project_BN/moving_meanVarHandleOp*
shape:8*0
shared_name!block_15_project_BN/moving_mean*2
_class(
&$loc:@block_15_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
@block_15_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_15_project_BN/moving_mean*
_output_shapes
: 
?
&block_15_project_BN/moving_mean/AssignAssignVariableOpblock_15_project_BN/moving_mean1block_15_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_15_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_15_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
4block_15_project_BN/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:8*
valueB8*  ??*6
_class,
*(loc:@block_15_project_BN/moving_variance
?
#block_15_project_BN/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *
shape:8*4
shared_name%#block_15_project_BN/moving_variance*6
_class,
*(loc:@block_15_project_BN/moving_variance
?
Dblock_15_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_15_project_BN/moving_variance*
_output_shapes
: 
?
*block_15_project_BN/moving_variance/AssignAssignVariableOp#block_15_project_BN/moving_variance4block_15_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_15_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_15_project_BN/moving_variance*
dtype0*
_output_shapes
:8
x
"block_15_project_BN/ReadVariableOpReadVariableOpblock_15_project_BN/gamma*
dtype0*
_output_shapes
:8
y
$block_15_project_BN/ReadVariableOp_1ReadVariableOpblock_15_project_BN/beta*
dtype0*
_output_shapes
:8
?
3block_15_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
5block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_15_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
$block_15_project_BN/FusedBatchNormV3FusedBatchNormV3block_15_project/Conv2D"block_15_project_BN/ReadVariableOp$block_15_project_BN/ReadVariableOp_13block_15_project_BN/FusedBatchNormV3/ReadVariableOp5block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????8:8:8:8:8:*
is_training( 
^
block_15_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
block_15_add/addAddV2block_14_add/add$block_15_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????8
?
7block_16_expand/kernel/Initializer/random_uniform/shapeConst*%
valueB"      8   P  *)
_class
loc:@block_16_expand/kernel*
dtype0*
_output_shapes
:
?
5block_16_expand/kernel/Initializer/random_uniform/minConst*
valueB
 *?_??*)
_class
loc:@block_16_expand/kernel*
dtype0*
_output_shapes
: 
?
5block_16_expand/kernel/Initializer/random_uniform/maxConst*
valueB
 *?_?=*)
_class
loc:@block_16_expand/kernel*
dtype0*
_output_shapes
: 
?
?block_16_expand/kernel/Initializer/random_uniform/RandomUniformRandomUniform7block_16_expand/kernel/Initializer/random_uniform/shape*
T0*)
_class
loc:@block_16_expand/kernel*
dtype0*'
_output_shapes
:8?
?
5block_16_expand/kernel/Initializer/random_uniform/subSub5block_16_expand/kernel/Initializer/random_uniform/max5block_16_expand/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*)
_class
loc:@block_16_expand/kernel
?
5block_16_expand/kernel/Initializer/random_uniform/mulMul?block_16_expand/kernel/Initializer/random_uniform/RandomUniform5block_16_expand/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@block_16_expand/kernel*'
_output_shapes
:8?
?
1block_16_expand/kernel/Initializer/random_uniformAdd5block_16_expand/kernel/Initializer/random_uniform/mul5block_16_expand/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@block_16_expand/kernel*'
_output_shapes
:8?
?
block_16_expand/kernelVarHandleOp*'
shared_nameblock_16_expand/kernel*)
_class
loc:@block_16_expand/kernel*
dtype0*
_output_shapes
: *
shape:8?
}
7block_16_expand/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_expand/kernel*
_output_shapes
: 
?
block_16_expand/kernel/AssignAssignVariableOpblock_16_expand/kernel1block_16_expand/kernel/Initializer/random_uniform*
dtype0
?
*block_16_expand/kernel/Read/ReadVariableOpReadVariableOpblock_16_expand/kernel*
dtype0*'
_output_shapes
:8?
n
block_16_expand/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
%block_16_expand/Conv2D/ReadVariableOpReadVariableOpblock_16_expand/kernel*
dtype0*'
_output_shapes
:8?
?
block_16_expand/Conv2DConv2Dblock_15_add/add%block_16_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
)block_16_expand_BN/gamma/Initializer/onesConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??*+
_class!
loc:@block_16_expand_BN/gamma
?
block_16_expand_BN/gammaVarHandleOp*)
shared_nameblock_16_expand_BN/gamma*+
_class!
loc:@block_16_expand_BN/gamma*
dtype0*
_output_shapes
: *
shape:?
?
9block_16_expand_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_expand_BN/gamma*
_output_shapes
: 
?
block_16_expand_BN/gamma/AssignAssignVariableOpblock_16_expand_BN/gamma)block_16_expand_BN/gamma/Initializer/ones*
dtype0
?
,block_16_expand_BN/gamma/Read/ReadVariableOpReadVariableOpblock_16_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
)block_16_expand_BN/beta/Initializer/zerosConst*
valueB?*    **
_class 
loc:@block_16_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
block_16_expand_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*(
shared_nameblock_16_expand_BN/beta**
_class 
loc:@block_16_expand_BN/beta

8block_16_expand_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_expand_BN/beta*
_output_shapes
: 
?
block_16_expand_BN/beta/AssignAssignVariableOpblock_16_expand_BN/beta)block_16_expand_BN/beta/Initializer/zeros*
dtype0
?
+block_16_expand_BN/beta/Read/ReadVariableOpReadVariableOpblock_16_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
0block_16_expand_BN/moving_mean/Initializer/zerosConst*
valueB?*    *1
_class'
%#loc:@block_16_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
block_16_expand_BN/moving_meanVarHandleOp*1
_class'
%#loc:@block_16_expand_BN/moving_mean*
dtype0*
_output_shapes
: *
shape:?*/
shared_name block_16_expand_BN/moving_mean
?
?block_16_expand_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_expand_BN/moving_mean*
_output_shapes
: 
?
%block_16_expand_BN/moving_mean/AssignAssignVariableOpblock_16_expand_BN/moving_mean0block_16_expand_BN/moving_mean/Initializer/zeros*
dtype0
?
2block_16_expand_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_16_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
3block_16_expand_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*5
_class+
)'loc:@block_16_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
"block_16_expand_BN/moving_varianceVarHandleOp*5
_class+
)'loc:@block_16_expand_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:?*3
shared_name$"block_16_expand_BN/moving_variance
?
Cblock_16_expand_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp"block_16_expand_BN/moving_variance*
_output_shapes
: 
?
)block_16_expand_BN/moving_variance/AssignAssignVariableOp"block_16_expand_BN/moving_variance3block_16_expand_BN/moving_variance/Initializer/ones*
dtype0
?
6block_16_expand_BN/moving_variance/Read/ReadVariableOpReadVariableOp"block_16_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
w
!block_16_expand_BN/ReadVariableOpReadVariableOpblock_16_expand_BN/gamma*
dtype0*
_output_shapes	
:?
x
#block_16_expand_BN/ReadVariableOp_1ReadVariableOpblock_16_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
2block_16_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
4block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_16_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
#block_16_expand_BN/FusedBatchNormV3FusedBatchNormV3block_16_expand/Conv2D!block_16_expand_BN/ReadVariableOp#block_16_expand_BN/ReadVariableOp_12block_16_expand_BN/FusedBatchNormV3/ReadVariableOp4block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
]
block_16_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_16_expand_relu/Relu6Relu6#block_16_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
Dblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/shapeConst*%
valueB"      P     *6
_class,
*(loc:@block_16_depthwise/depthwise_kernel*
dtype0*
_output_shapes
:
?
Bblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *?-6?*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel
?
Bblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *?-6=*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel
?
Lblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformRandomUniformDblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/shape*
T0*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
Bblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/subSubBblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/maxBblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel*
_output_shapes
: 
?
Bblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/mulMulLblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/RandomUniformBblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel*'
_output_shapes
:?
?
>block_16_depthwise/depthwise_kernel/Initializer/random_uniformAddBblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/mulBblock_16_depthwise/depthwise_kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel*'
_output_shapes
:?
?
#block_16_depthwise/depthwise_kernelVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*4
shared_name%#block_16_depthwise/depthwise_kernel*6
_class,
*(loc:@block_16_depthwise/depthwise_kernel
?
Dblock_16_depthwise/depthwise_kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_16_depthwise/depthwise_kernel*
_output_shapes
: 
?
*block_16_depthwise/depthwise_kernel/AssignAssignVariableOp#block_16_depthwise/depthwise_kernel>block_16_depthwise/depthwise_kernel/Initializer/random_uniform*
dtype0
?
7block_16_depthwise/depthwise_kernel/Read/ReadVariableOpReadVariableOp#block_16_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
+block_16_depthwise/depthwise/ReadVariableOpReadVariableOp#block_16_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
{
"block_16_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
{
*block_16_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
block_16_depthwise/depthwiseDepthwiseConv2dNativeblock_16_expand_relu/Relu6+block_16_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
,block_16_depthwise_BN/gamma/Initializer/onesConst*
valueB?*  ??*.
_class$
" loc:@block_16_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
block_16_depthwise_BN/gammaVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*,
shared_nameblock_16_depthwise_BN/gamma*.
_class$
" loc:@block_16_depthwise_BN/gamma
?
<block_16_depthwise_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_depthwise_BN/gamma*
_output_shapes
: 
?
"block_16_depthwise_BN/gamma/AssignAssignVariableOpblock_16_depthwise_BN/gamma,block_16_depthwise_BN/gamma/Initializer/ones*
dtype0
?
/block_16_depthwise_BN/gamma/Read/ReadVariableOpReadVariableOpblock_16_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,block_16_depthwise_BN/beta/Initializer/zerosConst*
valueB?*    *-
_class#
!loc:@block_16_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
block_16_depthwise_BN/betaVarHandleOp*-
_class#
!loc:@block_16_depthwise_BN/beta*
dtype0*
_output_shapes
: *
shape:?*+
shared_nameblock_16_depthwise_BN/beta
?
;block_16_depthwise_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_depthwise_BN/beta*
_output_shapes
: 
?
!block_16_depthwise_BN/beta/AssignAssignVariableOpblock_16_depthwise_BN/beta,block_16_depthwise_BN/beta/Initializer/zeros*
dtype0
?
.block_16_depthwise_BN/beta/Read/ReadVariableOpReadVariableOpblock_16_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
3block_16_depthwise_BN/moving_mean/Initializer/zerosConst*
valueB?*    *4
_class*
(&loc:@block_16_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
!block_16_depthwise_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:?*2
shared_name#!block_16_depthwise_BN/moving_mean*4
_class*
(&loc:@block_16_depthwise_BN/moving_mean
?
Bblock_16_depthwise_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp!block_16_depthwise_BN/moving_mean*
_output_shapes
: 
?
(block_16_depthwise_BN/moving_mean/AssignAssignVariableOp!block_16_depthwise_BN/moving_mean3block_16_depthwise_BN/moving_mean/Initializer/zeros*
dtype0
?
5block_16_depthwise_BN/moving_mean/Read/ReadVariableOpReadVariableOp!block_16_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
6block_16_depthwise_BN/moving_variance/Initializer/onesConst*
valueB?*  ??*8
_class.
,*loc:@block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
%block_16_depthwise_BN/moving_varianceVarHandleOp*
shape:?*6
shared_name'%block_16_depthwise_BN/moving_variance*8
_class.
,*loc:@block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes
: 
?
Fblock_16_depthwise_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp%block_16_depthwise_BN/moving_variance*
_output_shapes
: 
?
,block_16_depthwise_BN/moving_variance/AssignAssignVariableOp%block_16_depthwise_BN/moving_variance6block_16_depthwise_BN/moving_variance/Initializer/ones*
dtype0
?
9block_16_depthwise_BN/moving_variance/Read/ReadVariableOpReadVariableOp%block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
}
$block_16_depthwise_BN/ReadVariableOpReadVariableOpblock_16_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
~
&block_16_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_16_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
5block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_16_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
7block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
&block_16_depthwise_BN/FusedBatchNormV3FusedBatchNormV3block_16_depthwise/depthwise$block_16_depthwise_BN/ReadVariableOp&block_16_depthwise_BN/ReadVariableOp_15block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp7block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
`
block_16_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
block_16_depthwise_relu/Relu6Relu6&block_16_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
8block_16_project/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"      P  p   **
_class 
loc:@block_16_project/kernel
?
6block_16_project/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *???**
_class 
loc:@block_16_project/kernel
?
6block_16_project/kernel/Initializer/random_uniform/maxConst*
valueB
 *??=**
_class 
loc:@block_16_project/kernel*
dtype0*
_output_shapes
: 
?
@block_16_project/kernel/Initializer/random_uniform/RandomUniformRandomUniform8block_16_project/kernel/Initializer/random_uniform/shape*
T0**
_class 
loc:@block_16_project/kernel*
dtype0*'
_output_shapes
:?p
?
6block_16_project/kernel/Initializer/random_uniform/subSub6block_16_project/kernel/Initializer/random_uniform/max6block_16_project/kernel/Initializer/random_uniform/min*
T0**
_class 
loc:@block_16_project/kernel*
_output_shapes
: 
?
6block_16_project/kernel/Initializer/random_uniform/mulMul@block_16_project/kernel/Initializer/random_uniform/RandomUniform6block_16_project/kernel/Initializer/random_uniform/sub*
T0**
_class 
loc:@block_16_project/kernel*'
_output_shapes
:?p
?
2block_16_project/kernel/Initializer/random_uniformAdd6block_16_project/kernel/Initializer/random_uniform/mul6block_16_project/kernel/Initializer/random_uniform/min*'
_output_shapes
:?p*
T0**
_class 
loc:@block_16_project/kernel
?
block_16_project/kernelVarHandleOp*(
shared_nameblock_16_project/kernel**
_class 
loc:@block_16_project/kernel*
dtype0*
_output_shapes
: *
shape:?p

8block_16_project/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_project/kernel*
_output_shapes
: 
?
block_16_project/kernel/AssignAssignVariableOpblock_16_project/kernel2block_16_project/kernel/Initializer/random_uniform*
dtype0
?
+block_16_project/kernel/Read/ReadVariableOpReadVariableOpblock_16_project/kernel*
dtype0*'
_output_shapes
:?p
o
block_16_project/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
&block_16_project/Conv2D/ReadVariableOpReadVariableOpblock_16_project/kernel*
dtype0*'
_output_shapes
:?p
?
block_16_project/Conv2DConv2Dblock_16_depthwise_relu/Relu6&block_16_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????p*
paddingSAME
?
*block_16_project_BN/gamma/Initializer/onesConst*
valueBp*  ??*,
_class"
 loc:@block_16_project_BN/gamma*
dtype0*
_output_shapes
:p
?
block_16_project_BN/gammaVarHandleOp*
shape:p**
shared_nameblock_16_project_BN/gamma*,
_class"
 loc:@block_16_project_BN/gamma*
dtype0*
_output_shapes
: 
?
:block_16_project_BN/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_project_BN/gamma*
_output_shapes
: 
?
 block_16_project_BN/gamma/AssignAssignVariableOpblock_16_project_BN/gamma*block_16_project_BN/gamma/Initializer/ones*
dtype0
?
-block_16_project_BN/gamma/Read/ReadVariableOpReadVariableOpblock_16_project_BN/gamma*
dtype0*
_output_shapes
:p
?
*block_16_project_BN/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:p*
valueBp*    *+
_class!
loc:@block_16_project_BN/beta
?
block_16_project_BN/betaVarHandleOp*
dtype0*
_output_shapes
: *
shape:p*)
shared_nameblock_16_project_BN/beta*+
_class!
loc:@block_16_project_BN/beta
?
9block_16_project_BN/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_project_BN/beta*
_output_shapes
: 
?
block_16_project_BN/beta/AssignAssignVariableOpblock_16_project_BN/beta*block_16_project_BN/beta/Initializer/zeros*
dtype0
?
,block_16_project_BN/beta/Read/ReadVariableOpReadVariableOpblock_16_project_BN/beta*
dtype0*
_output_shapes
:p
?
1block_16_project_BN/moving_mean/Initializer/zerosConst*
valueBp*    *2
_class(
&$loc:@block_16_project_BN/moving_mean*
dtype0*
_output_shapes
:p
?
block_16_project_BN/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape:p*0
shared_name!block_16_project_BN/moving_mean*2
_class(
&$loc:@block_16_project_BN/moving_mean
?
@block_16_project_BN/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpblock_16_project_BN/moving_mean*
_output_shapes
: 
?
&block_16_project_BN/moving_mean/AssignAssignVariableOpblock_16_project_BN/moving_mean1block_16_project_BN/moving_mean/Initializer/zeros*
dtype0
?
3block_16_project_BN/moving_mean/Read/ReadVariableOpReadVariableOpblock_16_project_BN/moving_mean*
dtype0*
_output_shapes
:p
?
4block_16_project_BN/moving_variance/Initializer/onesConst*
valueBp*  ??*6
_class,
*(loc:@block_16_project_BN/moving_variance*
dtype0*
_output_shapes
:p
?
#block_16_project_BN/moving_varianceVarHandleOp*4
shared_name%#block_16_project_BN/moving_variance*6
_class,
*(loc:@block_16_project_BN/moving_variance*
dtype0*
_output_shapes
: *
shape:p
?
Dblock_16_project_BN/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp#block_16_project_BN/moving_variance*
_output_shapes
: 
?
*block_16_project_BN/moving_variance/AssignAssignVariableOp#block_16_project_BN/moving_variance4block_16_project_BN/moving_variance/Initializer/ones*
dtype0
?
7block_16_project_BN/moving_variance/Read/ReadVariableOpReadVariableOp#block_16_project_BN/moving_variance*
dtype0*
_output_shapes
:p
x
"block_16_project_BN/ReadVariableOpReadVariableOpblock_16_project_BN/gamma*
dtype0*
_output_shapes
:p
y
$block_16_project_BN/ReadVariableOp_1ReadVariableOpblock_16_project_BN/beta*
dtype0*
_output_shapes
:p
?
3block_16_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_project_BN/moving_mean*
dtype0*
_output_shapes
:p
?
5block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_16_project_BN/moving_variance*
dtype0*
_output_shapes
:p
?
$block_16_project_BN/FusedBatchNormV3FusedBatchNormV3block_16_project/Conv2D"block_16_project_BN/ReadVariableOp$block_16_project_BN/ReadVariableOp_13block_16_project_BN/FusedBatchNormV3/ReadVariableOp5block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????p:p:p:p:p:*
is_training( 
^
block_16_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
.Conv_1/kernel/Initializer/random_uniform/shapeConst*%
valueB"      p      * 
_class
loc:@Conv_1/kernel*
dtype0*
_output_shapes
:
?
,Conv_1/kernel/Initializer/random_uniform/minConst*
valueB
 *2u??* 
_class
loc:@Conv_1/kernel*
dtype0*
_output_shapes
: 
?
,Conv_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *2u?=* 
_class
loc:@Conv_1/kernel*
dtype0*
_output_shapes
: 
?
6Conv_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform.Conv_1/kernel/Initializer/random_uniform/shape*
T0* 
_class
loc:@Conv_1/kernel*
dtype0*'
_output_shapes
:p?

?
,Conv_1/kernel/Initializer/random_uniform/subSub,Conv_1/kernel/Initializer/random_uniform/max,Conv_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0* 
_class
loc:@Conv_1/kernel
?
,Conv_1/kernel/Initializer/random_uniform/mulMul6Conv_1/kernel/Initializer/random_uniform/RandomUniform,Conv_1/kernel/Initializer/random_uniform/sub*
T0* 
_class
loc:@Conv_1/kernel*'
_output_shapes
:p?

?
(Conv_1/kernel/Initializer/random_uniformAdd,Conv_1/kernel/Initializer/random_uniform/mul,Conv_1/kernel/Initializer/random_uniform/min*'
_output_shapes
:p?
*
T0* 
_class
loc:@Conv_1/kernel
?
Conv_1/kernelVarHandleOp* 
_class
loc:@Conv_1/kernel*
dtype0*
_output_shapes
: *
shape:p?
*
shared_nameConv_1/kernel
k
.Conv_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv_1/kernel*
_output_shapes
: 
n
Conv_1/kernel/AssignAssignVariableOpConv_1/kernel(Conv_1/kernel/Initializer/random_uniform*
dtype0
x
!Conv_1/kernel/Read/ReadVariableOpReadVariableOpConv_1/kernel*
dtype0*'
_output_shapes
:p?

e
Conv_1/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
s
Conv_1/Conv2D/ReadVariableOpReadVariableOpConv_1/kernel*
dtype0*'
_output_shapes
:p?

?
Conv_1/Conv2DConv2D$block_16_project_BN/FusedBatchNormV3Conv_1/Conv2D/ReadVariableOp*
paddingVALID*
T0*
strides
*0
_output_shapes
:??????????

?
0Conv_1_bn/gamma/Initializer/ones/shape_as_tensorConst*
valueB:?
*"
_class
loc:@Conv_1_bn/gamma*
dtype0*
_output_shapes
:
?
&Conv_1_bn/gamma/Initializer/ones/ConstConst*
valueB
 *  ??*"
_class
loc:@Conv_1_bn/gamma*
dtype0*
_output_shapes
: 
?
 Conv_1_bn/gamma/Initializer/onesFill0Conv_1_bn/gamma/Initializer/ones/shape_as_tensor&Conv_1_bn/gamma/Initializer/ones/Const*
T0*"
_class
loc:@Conv_1_bn/gamma*
_output_shapes	
:?

?
Conv_1_bn/gammaVarHandleOp*
shape:?
* 
shared_nameConv_1_bn/gamma*"
_class
loc:@Conv_1_bn/gamma*
dtype0*
_output_shapes
: 
o
0Conv_1_bn/gamma/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv_1_bn/gamma*
_output_shapes
: 
j
Conv_1_bn/gamma/AssignAssignVariableOpConv_1_bn/gamma Conv_1_bn/gamma/Initializer/ones*
dtype0
p
#Conv_1_bn/gamma/Read/ReadVariableOpReadVariableOpConv_1_bn/gamma*
dtype0*
_output_shapes	
:?

?
0Conv_1_bn/beta/Initializer/zeros/shape_as_tensorConst*
valueB:?
*!
_class
loc:@Conv_1_bn/beta*
dtype0*
_output_shapes
:
?
&Conv_1_bn/beta/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@Conv_1_bn/beta*
dtype0*
_output_shapes
: 
?
 Conv_1_bn/beta/Initializer/zerosFill0Conv_1_bn/beta/Initializer/zeros/shape_as_tensor&Conv_1_bn/beta/Initializer/zeros/Const*
T0*!
_class
loc:@Conv_1_bn/beta*
_output_shapes	
:?

?
Conv_1_bn/betaVarHandleOp*
shared_nameConv_1_bn/beta*!
_class
loc:@Conv_1_bn/beta*
dtype0*
_output_shapes
: *
shape:?

m
/Conv_1_bn/beta/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv_1_bn/beta*
_output_shapes
: 
h
Conv_1_bn/beta/AssignAssignVariableOpConv_1_bn/beta Conv_1_bn/beta/Initializer/zeros*
dtype0
n
"Conv_1_bn/beta/Read/ReadVariableOpReadVariableOpConv_1_bn/beta*
dtype0*
_output_shapes	
:?

?
7Conv_1_bn/moving_mean/Initializer/zeros/shape_as_tensorConst*
valueB:?
*(
_class
loc:@Conv_1_bn/moving_mean*
dtype0*
_output_shapes
:
?
-Conv_1_bn/moving_mean/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    *(
_class
loc:@Conv_1_bn/moving_mean
?
'Conv_1_bn/moving_mean/Initializer/zerosFill7Conv_1_bn/moving_mean/Initializer/zeros/shape_as_tensor-Conv_1_bn/moving_mean/Initializer/zeros/Const*
T0*(
_class
loc:@Conv_1_bn/moving_mean*
_output_shapes	
:?

?
Conv_1_bn/moving_meanVarHandleOp*
shape:?
*&
shared_nameConv_1_bn/moving_mean*(
_class
loc:@Conv_1_bn/moving_mean*
dtype0*
_output_shapes
: 
{
6Conv_1_bn/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv_1_bn/moving_mean*
_output_shapes
: 
}
Conv_1_bn/moving_mean/AssignAssignVariableOpConv_1_bn/moving_mean'Conv_1_bn/moving_mean/Initializer/zeros*
dtype0
|
)Conv_1_bn/moving_mean/Read/ReadVariableOpReadVariableOpConv_1_bn/moving_mean*
dtype0*
_output_shapes	
:?

?
:Conv_1_bn/moving_variance/Initializer/ones/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:?
*,
_class"
 loc:@Conv_1_bn/moving_variance
?
0Conv_1_bn/moving_variance/Initializer/ones/ConstConst*
valueB
 *  ??*,
_class"
 loc:@Conv_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
*Conv_1_bn/moving_variance/Initializer/onesFill:Conv_1_bn/moving_variance/Initializer/ones/shape_as_tensor0Conv_1_bn/moving_variance/Initializer/ones/Const*
T0*,
_class"
 loc:@Conv_1_bn/moving_variance*
_output_shapes	
:?

?
Conv_1_bn/moving_varianceVarHandleOp*,
_class"
 loc:@Conv_1_bn/moving_variance*
dtype0*
_output_shapes
: *
shape:?
**
shared_nameConv_1_bn/moving_variance
?
:Conv_1_bn/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOpConv_1_bn/moving_variance*
_output_shapes
: 
?
 Conv_1_bn/moving_variance/AssignAssignVariableOpConv_1_bn/moving_variance*Conv_1_bn/moving_variance/Initializer/ones*
dtype0
?
-Conv_1_bn/moving_variance/Read/ReadVariableOpReadVariableOpConv_1_bn/moving_variance*
dtype0*
_output_shapes	
:?

e
Conv_1_bn/ReadVariableOpReadVariableOpConv_1_bn/gamma*
dtype0*
_output_shapes	
:?

f
Conv_1_bn/ReadVariableOp_1ReadVariableOpConv_1_bn/beta*
dtype0*
_output_shapes	
:?

|
)Conv_1_bn/FusedBatchNormV3/ReadVariableOpReadVariableOpConv_1_bn/moving_mean*
dtype0*
_output_shapes	
:?

?
+Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpConv_1_bn/moving_variance*
dtype0*
_output_shapes	
:?

?
Conv_1_bn/FusedBatchNormV3FusedBatchNormV3Conv_1/Conv2DConv_1_bn/ReadVariableOpConv_1_bn/ReadVariableOp_1)Conv_1_bn/FusedBatchNormV3/ReadVariableOp+Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????
:?
:?
:?
:?
:*
is_training( 
T
Conv_1_bn/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
n
out_relu/Relu6Relu6Conv_1_bn/FusedBatchNormV3*
T0*0
_output_shapes
:??????????

?
model1_inputPlaceholder*&
shape:???????????*
dtype0*1
_output_shapes
:???????????
?
model1/Conv1_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
model1/Conv1_pad/PadPadmodel1_inputmodel1/Conv1_pad/Pad/paddings*
T0*1
_output_shapes
:???????????
w
"model1/Conv1/Conv2D/ReadVariableOpReadVariableOpConv1/kernel*
dtype0*&
_output_shapes
:
?
model1/Conv1/Conv2DConv2Dmodel1/Conv1_pad/Pad"model1/Conv1/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????pp*
paddingVALID
i
model1/bn_Conv1/ReadVariableOpReadVariableOpbn_Conv1/gamma*
dtype0*
_output_shapes
:
j
 model1/bn_Conv1/ReadVariableOp_1ReadVariableOpbn_Conv1/beta*
dtype0*
_output_shapes
:
?
/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOpReadVariableOpbn_Conv1/moving_mean*
dtype0*
_output_shapes
:
?
1model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpbn_Conv1/moving_variance*
dtype0*
_output_shapes
:
?
 model1/bn_Conv1/FusedBatchNormV3FusedBatchNormV3model1/Conv1/Conv2Dmodel1/bn_Conv1/ReadVariableOp model1/bn_Conv1/ReadVariableOp_1/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp1model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????pp:::::*
is_training( 
Z
model1/bn_Conv1/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
|
model1/Conv1_relu/Relu6Relu6 model1/bn_Conv1/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp
?
7model1/expanded_conv_depthwise/depthwise/ReadVariableOpReadVariableOp(expanded_conv_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:
?
.model1/expanded_conv_depthwise/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
?
6model1/expanded_conv_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
(model1/expanded_conv_depthwise/depthwiseDepthwiseConv2dNativemodel1/Conv1_relu/Relu67model1/expanded_conv_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????pp
?
0model1/expanded_conv_depthwise_BN/ReadVariableOpReadVariableOp expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
:
?
2model1/expanded_conv_depthwise_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
:
?
Amodel1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp&expanded_conv_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:
?
Cmodel1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*expanded_conv_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:
?
2model1/expanded_conv_depthwise_BN/FusedBatchNormV3FusedBatchNormV3(model1/expanded_conv_depthwise/depthwise0model1/expanded_conv_depthwise_BN/ReadVariableOp2model1/expanded_conv_depthwise_BN/ReadVariableOp_1Amodel1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOpCmodel1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????pp:::::*
is_training( 
l
'model1/expanded_conv_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
)model1/expanded_conv_depthwise_relu/Relu6Relu62model1/expanded_conv_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp
?
2model1/expanded_conv_project/Conv2D/ReadVariableOpReadVariableOpexpanded_conv_project/kernel*
dtype0*&
_output_shapes
:
?
#model1/expanded_conv_project/Conv2DConv2D)model1/expanded_conv_depthwise_relu/Relu62model1/expanded_conv_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????pp
?
.model1/expanded_conv_project_BN/ReadVariableOpReadVariableOpexpanded_conv_project_BN/gamma*
dtype0*
_output_shapes
:
?
0model1/expanded_conv_project_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_project_BN/beta*
dtype0*
_output_shapes
:
?
?model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp$expanded_conv_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Amodel1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp(expanded_conv_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
0model1/expanded_conv_project_BN/FusedBatchNormV3FusedBatchNormV3#model1/expanded_conv_project/Conv2D.model1/expanded_conv_project_BN/ReadVariableOp0model1/expanded_conv_project_BN/ReadVariableOp_1?model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOpAmodel1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????pp:::::*
is_training( *
epsilon%o?:
j
%model1/expanded_conv_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
+model1/block_1_expand/Conv2D/ReadVariableOpReadVariableOpblock_1_expand/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_1_expand/Conv2DConv2D0model1/expanded_conv_project_BN/FusedBatchNormV3+model1/block_1_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????pp0*
paddingSAME
{
'model1/block_1_expand_BN/ReadVariableOpReadVariableOpblock_1_expand_BN/gamma*
dtype0*
_output_shapes
:0
|
)model1/block_1_expand_BN/ReadVariableOp_1ReadVariableOpblock_1_expand_BN/beta*
dtype0*
_output_shapes
:0
?
8model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
:model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_1_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
)model1/block_1_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_1_expand/Conv2D'model1/block_1_expand_BN/ReadVariableOp)model1/block_1_expand_BN/ReadVariableOp_18model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????pp0:0:0:0:0:*
epsilon%o?:*
T0*
U0
c
model1/block_1_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_1_expand_relu/Relu6Relu6)model1/block_1_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp0
?
model1/block_1_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
model1/block_1_pad/PadPad model1/block_1_expand_relu/Relu6model1/block_1_pad/Pad/paddings*
T0*/
_output_shapes
:?????????qq0
?
1model1/block_1_depthwise/depthwise/ReadVariableOpReadVariableOp"block_1_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
(model1/block_1_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
0model1/block_1_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
"model1/block_1_depthwise/depthwiseDepthwiseConv2dNativemodel1/block_1_pad/Pad1model1/block_1_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????880
?
*model1/block_1_depthwise_BN/ReadVariableOpReadVariableOpblock_1_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
,model1/block_1_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_1_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
;model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
=model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
,model1/block_1_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_1_depthwise/depthwise*model1/block_1_depthwise_BN/ReadVariableOp,model1/block_1_depthwise_BN/ReadVariableOp_1;model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( 
f
!model1/block_1_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
#model1/block_1_depthwise_relu/Relu6Relu6,model1/block_1_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????880*
T0
?
,model1/block_1_project/Conv2D/ReadVariableOpReadVariableOpblock_1_project/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_1_project/Conv2DConv2D#model1/block_1_depthwise_relu/Relu6,model1/block_1_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????88*
paddingSAME*
T0
}
(model1/block_1_project_BN/ReadVariableOpReadVariableOpblock_1_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_1_project_BN/ReadVariableOp_1ReadVariableOpblock_1_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_1_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_1_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_1_project/Conv2D(model1/block_1_project_BN/ReadVariableOp*model1/block_1_project_BN/ReadVariableOp_19model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????88:::::*
epsilon%o?:*
T0*
U0
d
model1/block_1_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
+model1/block_2_expand/Conv2D/ReadVariableOpReadVariableOpblock_2_expand/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_2_expand/Conv2DConv2D*model1/block_1_project_BN/FusedBatchNormV3+model1/block_2_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????880
{
'model1/block_2_expand_BN/ReadVariableOpReadVariableOpblock_2_expand_BN/gamma*
dtype0*
_output_shapes
:0
|
)model1/block_2_expand_BN/ReadVariableOp_1ReadVariableOpblock_2_expand_BN/beta*
dtype0*
_output_shapes
:0
?
8model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
:model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_2_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
)model1/block_2_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_2_expand/Conv2D'model1/block_2_expand_BN/ReadVariableOp)model1/block_2_expand_BN/ReadVariableOp_18model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( *
epsilon%o?:
c
model1/block_2_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_2_expand_relu/Relu6Relu6)model1/block_2_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
1model1/block_2_depthwise/depthwise/ReadVariableOpReadVariableOp"block_2_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
(model1/block_2_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
0model1/block_2_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_2_depthwise/depthwiseDepthwiseConv2dNative model1/block_2_expand_relu/Relu61model1/block_2_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????880
?
*model1/block_2_depthwise_BN/ReadVariableOpReadVariableOpblock_2_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
,model1/block_2_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_2_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
;model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_2_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
=model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_2_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
,model1/block_2_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_2_depthwise/depthwise*model1/block_2_depthwise_BN/ReadVariableOp,model1/block_2_depthwise_BN/ReadVariableOp_1;model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( *
epsilon%o?:*
T0*
U0
f
!model1/block_2_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
#model1/block_2_depthwise_relu/Relu6Relu6,model1/block_2_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
,model1/block_2_project/Conv2D/ReadVariableOpReadVariableOpblock_2_project/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_2_project/Conv2DConv2D#model1/block_2_depthwise_relu/Relu6,model1/block_2_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????88*
paddingSAME*
T0
}
(model1/block_2_project_BN/ReadVariableOpReadVariableOpblock_2_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_2_project_BN/ReadVariableOp_1ReadVariableOpblock_2_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_2_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_2_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_2_project/Conv2D(model1/block_2_project_BN/ReadVariableOp*model1/block_2_project_BN/ReadVariableOp_19model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????88:::::*
is_training( *
epsilon%o?:
d
model1/block_2_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_2_add/addAddV2*model1/block_1_project_BN/FusedBatchNormV3*model1/block_2_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????88*
T0
?
+model1/block_3_expand/Conv2D/ReadVariableOpReadVariableOpblock_3_expand/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_3_expand/Conv2DConv2Dmodel1/block_2_add/add+model1/block_3_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????880
{
'model1/block_3_expand_BN/ReadVariableOpReadVariableOpblock_3_expand_BN/gamma*
dtype0*
_output_shapes
:0
|
)model1/block_3_expand_BN/ReadVariableOp_1ReadVariableOpblock_3_expand_BN/beta*
dtype0*
_output_shapes
:0
?
8model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
:model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_3_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
)model1/block_3_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_3_expand/Conv2D'model1/block_3_expand_BN/ReadVariableOp)model1/block_3_expand_BN/ReadVariableOp_18model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????880:0:0:0:0:*
epsilon%o?:*
T0*
U0
c
model1/block_3_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_3_expand_relu/Relu6Relu6)model1/block_3_expand_BN/FusedBatchNormV3*/
_output_shapes
:?????????880*
T0
?
model1/block_3_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
model1/block_3_pad/PadPad model1/block_3_expand_relu/Relu6model1/block_3_pad/Pad/paddings*
T0*/
_output_shapes
:?????????990
?
1model1/block_3_depthwise/depthwise/ReadVariableOpReadVariableOp"block_3_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
(model1/block_3_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
0model1/block_3_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_3_depthwise/depthwiseDepthwiseConv2dNativemodel1/block_3_pad/Pad1model1/block_3_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????0
?
*model1/block_3_depthwise_BN/ReadVariableOpReadVariableOpblock_3_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
,model1/block_3_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_3_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
;model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
=model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
,model1/block_3_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_3_depthwise/depthwise*model1/block_3_depthwise_BN/ReadVariableOp,model1/block_3_depthwise_BN/ReadVariableOp_1;model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????0:0:0:0:0:*
is_training( 
f
!model1/block_3_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_3_depthwise_relu/Relu6Relu6,model1/block_3_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????0
?
,model1/block_3_project/Conv2D/ReadVariableOpReadVariableOpblock_3_project/kernel*
dtype0*&
_output_shapes
:0
?
model1/block_3_project/Conv2DConv2D#model1/block_3_depthwise_relu/Relu6,model1/block_3_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
}
(model1/block_3_project_BN/ReadVariableOpReadVariableOpblock_3_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_3_project_BN/ReadVariableOp_1ReadVariableOpblock_3_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_3_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_3_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_3_project/Conv2D(model1/block_3_project_BN/ReadVariableOp*model1/block_3_project_BN/ReadVariableOp_19model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::
d
model1/block_3_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
+model1/block_4_expand/Conv2D/ReadVariableOpReadVariableOpblock_4_expand/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_4_expand/Conv2DConv2D*model1/block_3_project_BN/FusedBatchNormV3+model1/block_4_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
{
'model1/block_4_expand_BN/ReadVariableOpReadVariableOpblock_4_expand_BN/gamma*
dtype0*
_output_shapes
:`
|
)model1/block_4_expand_BN/ReadVariableOp_1ReadVariableOpblock_4_expand_BN/beta*
dtype0*
_output_shapes
:`
?
8model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
:model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_4_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
)model1/block_4_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_4_expand/Conv2D'model1/block_4_expand_BN/ReadVariableOp)model1/block_4_expand_BN/ReadVariableOp_18model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:*
T0*
U0
c
model1/block_4_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_4_expand_relu/Relu6Relu6)model1/block_4_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
1model1/block_4_depthwise/depthwise/ReadVariableOpReadVariableOp"block_4_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
(model1/block_4_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
0model1/block_4_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
"model1/block_4_depthwise/depthwiseDepthwiseConv2dNative model1/block_4_expand_relu/Relu61model1/block_4_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
*model1/block_4_depthwise_BN/ReadVariableOpReadVariableOpblock_4_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
,model1/block_4_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_4_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
;model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_4_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
=model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
,model1/block_4_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_4_depthwise/depthwise*model1/block_4_depthwise_BN/ReadVariableOp,model1/block_4_depthwise_BN/ReadVariableOp_1;model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:
f
!model1/block_4_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_4_depthwise_relu/Relu6Relu6,model1/block_4_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????`*
T0
?
,model1/block_4_project/Conv2D/ReadVariableOpReadVariableOpblock_4_project/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_4_project/Conv2DConv2D#model1/block_4_depthwise_relu/Relu6,model1/block_4_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
}
(model1/block_4_project_BN/ReadVariableOpReadVariableOpblock_4_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_4_project_BN/ReadVariableOp_1ReadVariableOpblock_4_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_4_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_4_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_4_project/Conv2D(model1/block_4_project_BN/ReadVariableOp*model1/block_4_project_BN/ReadVariableOp_19model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:
d
model1/block_4_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_4_add/addAddV2*model1/block_3_project_BN/FusedBatchNormV3*model1/block_4_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????*
T0
?
+model1/block_5_expand/Conv2D/ReadVariableOpReadVariableOpblock_5_expand/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_5_expand/Conv2DConv2Dmodel1/block_4_add/add+model1/block_5_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????`*
paddingSAME
{
'model1/block_5_expand_BN/ReadVariableOpReadVariableOpblock_5_expand_BN/gamma*
dtype0*
_output_shapes
:`
|
)model1/block_5_expand_BN/ReadVariableOp_1ReadVariableOpblock_5_expand_BN/beta*
dtype0*
_output_shapes
:`
?
8model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
:model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_5_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
)model1/block_5_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_5_expand/Conv2D'model1/block_5_expand_BN/ReadVariableOp)model1/block_5_expand_BN/ReadVariableOp_18model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:
c
model1/block_5_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_5_expand_relu/Relu6Relu6)model1/block_5_expand_BN/FusedBatchNormV3*/
_output_shapes
:?????????`*
T0
?
1model1/block_5_depthwise/depthwise/ReadVariableOpReadVariableOp"block_5_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
(model1/block_5_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
0model1/block_5_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_5_depthwise/depthwiseDepthwiseConv2dNative model1/block_5_expand_relu/Relu61model1/block_5_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
*model1/block_5_depthwise_BN/ReadVariableOpReadVariableOpblock_5_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
,model1/block_5_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_5_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
;model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
=model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
,model1/block_5_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_5_depthwise/depthwise*model1/block_5_depthwise_BN/ReadVariableOp,model1/block_5_depthwise_BN/ReadVariableOp_1;model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:
f
!model1/block_5_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_5_depthwise_relu/Relu6Relu6,model1/block_5_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
,model1/block_5_project/Conv2D/ReadVariableOpReadVariableOpblock_5_project/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_5_project/Conv2DConv2D#model1/block_5_depthwise_relu/Relu6,model1/block_5_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
}
(model1/block_5_project_BN/ReadVariableOpReadVariableOpblock_5_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_5_project_BN/ReadVariableOp_1ReadVariableOpblock_5_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_5_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_5_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_5_project/Conv2D(model1/block_5_project_BN/ReadVariableOp*model1/block_5_project_BN/ReadVariableOp_19model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::
d
model1/block_5_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
model1/block_5_add/addAddV2model1/block_4_add/add*model1/block_5_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
+model1/block_6_expand/Conv2D/ReadVariableOpReadVariableOpblock_6_expand/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_6_expand/Conv2DConv2Dmodel1/block_5_add/add+model1/block_6_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
{
'model1/block_6_expand_BN/ReadVariableOpReadVariableOpblock_6_expand_BN/gamma*
dtype0*
_output_shapes
:`
|
)model1/block_6_expand_BN/ReadVariableOp_1ReadVariableOpblock_6_expand_BN/beta*
dtype0*
_output_shapes
:`
?
8model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
:model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_6_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
)model1/block_6_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_6_expand/Conv2D'model1/block_6_expand_BN/ReadVariableOp)model1/block_6_expand_BN/ReadVariableOp_18model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( *
epsilon%o?:
c
model1/block_6_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
 model1/block_6_expand_relu/Relu6Relu6)model1/block_6_expand_BN/FusedBatchNormV3*/
_output_shapes
:?????????`*
T0
?
model1/block_6_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
model1/block_6_pad/PadPad model1/block_6_expand_relu/Relu6model1/block_6_pad/Pad/paddings*
T0*/
_output_shapes
:?????????`
?
1model1/block_6_depthwise/depthwise/ReadVariableOpReadVariableOp"block_6_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
(model1/block_6_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
0model1/block_6_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_6_depthwise/depthwiseDepthwiseConv2dNativemodel1/block_6_pad/Pad1model1/block_6_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????`*
paddingVALID
?
*model1/block_6_depthwise_BN/ReadVariableOpReadVariableOpblock_6_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
,model1/block_6_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_6_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
;model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
=model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_6_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
,model1/block_6_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_6_depthwise/depthwise*model1/block_6_depthwise_BN/ReadVariableOp,model1/block_6_depthwise_BN/ReadVariableOp_1;model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( *
epsilon%o?:*
T0*
U0
f
!model1/block_6_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
#model1/block_6_depthwise_relu/Relu6Relu6,model1/block_6_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????`*
T0
?
,model1/block_6_project/Conv2D/ReadVariableOpReadVariableOpblock_6_project/kernel*
dtype0*&
_output_shapes
:`
?
model1/block_6_project/Conv2DConv2D#model1/block_6_depthwise_relu/Relu6,model1/block_6_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
}
(model1/block_6_project_BN/ReadVariableOpReadVariableOpblock_6_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_6_project_BN/ReadVariableOp_1ReadVariableOpblock_6_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_6_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_6_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_6_project/Conv2D(model1/block_6_project_BN/ReadVariableOp*model1/block_6_project_BN/ReadVariableOp_19model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:*
T0*
U0
d
model1/block_6_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
+model1/block_7_expand/Conv2D/ReadVariableOpReadVariableOpblock_7_expand/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_7_expand/Conv2DConv2D*model1/block_6_project_BN/FusedBatchNormV3+model1/block_7_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
|
'model1/block_7_expand_BN/ReadVariableOpReadVariableOpblock_7_expand_BN/gamma*
dtype0*
_output_shapes	
:?
}
)model1/block_7_expand_BN/ReadVariableOp_1ReadVariableOpblock_7_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
8model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
:model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_7_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
)model1/block_7_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_7_expand/Conv2D'model1/block_7_expand_BN/ReadVariableOp)model1/block_7_expand_BN/ReadVariableOp_18model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
c
model1/block_7_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_7_expand_relu/Relu6Relu6)model1/block_7_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
1model1/block_7_depthwise/depthwise/ReadVariableOpReadVariableOp"block_7_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
(model1/block_7_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
0model1/block_7_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_7_depthwise/depthwiseDepthwiseConv2dNative model1/block_7_expand_relu/Relu61model1/block_7_depthwise/depthwise/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
*model1/block_7_depthwise_BN/ReadVariableOpReadVariableOpblock_7_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,model1/block_7_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_7_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
;model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_7_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
=model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_7_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
,model1/block_7_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_7_depthwise/depthwise*model1/block_7_depthwise_BN/ReadVariableOp,model1/block_7_depthwise_BN/ReadVariableOp_1;model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
f
!model1/block_7_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_7_depthwise_relu/Relu6Relu6,model1/block_7_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
,model1/block_7_project/Conv2D/ReadVariableOpReadVariableOpblock_7_project/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_7_project/Conv2DConv2D#model1/block_7_depthwise_relu/Relu6,model1/block_7_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
}
(model1/block_7_project_BN/ReadVariableOpReadVariableOpblock_7_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_7_project_BN/ReadVariableOp_1ReadVariableOpblock_7_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_7_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_7_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_7_project/Conv2D(model1/block_7_project_BN/ReadVariableOp*model1/block_7_project_BN/ReadVariableOp_19model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
d
model1/block_7_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_7_add/addAddV2*model1/block_6_project_BN/FusedBatchNormV3*model1/block_7_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
+model1/block_8_expand/Conv2D/ReadVariableOpReadVariableOpblock_8_expand/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_8_expand/Conv2DConv2Dmodel1/block_7_add/add+model1/block_8_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
|
'model1/block_8_expand_BN/ReadVariableOpReadVariableOpblock_8_expand_BN/gamma*
dtype0*
_output_shapes	
:?
}
)model1/block_8_expand_BN/ReadVariableOp_1ReadVariableOpblock_8_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
8model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
:model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_8_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
)model1/block_8_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_8_expand/Conv2D'model1/block_8_expand_BN/ReadVariableOp)model1/block_8_expand_BN/ReadVariableOp_18model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:*
T0*
U0
c
model1/block_8_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
 model1/block_8_expand_relu/Relu6Relu6)model1/block_8_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
1model1/block_8_depthwise/depthwise/ReadVariableOpReadVariableOp"block_8_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
(model1/block_8_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
0model1/block_8_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
"model1/block_8_depthwise/depthwiseDepthwiseConv2dNative model1/block_8_expand_relu/Relu61model1/block_8_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
*model1/block_8_depthwise_BN/ReadVariableOpReadVariableOpblock_8_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,model1/block_8_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_8_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
;model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
=model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
,model1/block_8_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_8_depthwise/depthwise*model1/block_8_depthwise_BN/ReadVariableOp,model1/block_8_depthwise_BN/ReadVariableOp_1;model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
f
!model1/block_8_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_8_depthwise_relu/Relu6Relu6,model1/block_8_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
,model1/block_8_project/Conv2D/ReadVariableOpReadVariableOpblock_8_project/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_8_project/Conv2DConv2D#model1/block_8_depthwise_relu/Relu6,model1/block_8_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
}
(model1/block_8_project_BN/ReadVariableOpReadVariableOpblock_8_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_8_project_BN/ReadVariableOp_1ReadVariableOpblock_8_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_8_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_8_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_8_project/Conv2D(model1/block_8_project_BN/ReadVariableOp*model1/block_8_project_BN/ReadVariableOp_19model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::
d
model1/block_8_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_8_add/addAddV2model1/block_7_add/add*model1/block_8_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????*
T0
?
+model1/block_9_expand/Conv2D/ReadVariableOpReadVariableOpblock_9_expand/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_9_expand/Conv2DConv2Dmodel1/block_8_add/add+model1/block_9_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
|
'model1/block_9_expand_BN/ReadVariableOpReadVariableOpblock_9_expand_BN/gamma*
dtype0*
_output_shapes	
:?
}
)model1/block_9_expand_BN/ReadVariableOp_1ReadVariableOpblock_9_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
8model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
:model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_9_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
)model1/block_9_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_9_expand/Conv2D'model1/block_9_expand_BN/ReadVariableOp)model1/block_9_expand_BN/ReadVariableOp_18model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOp:model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
c
model1/block_9_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
 model1/block_9_expand_relu/Relu6Relu6)model1/block_9_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
1model1/block_9_depthwise/depthwise/ReadVariableOpReadVariableOp"block_9_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
(model1/block_9_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
0model1/block_9_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
"model1/block_9_depthwise/depthwiseDepthwiseConv2dNative model1/block_9_expand_relu/Relu61model1/block_9_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
*model1/block_9_depthwise_BN/ReadVariableOpReadVariableOpblock_9_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
,model1/block_9_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_9_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
;model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_9_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
=model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
,model1/block_9_depthwise_BN/FusedBatchNormV3FusedBatchNormV3"model1/block_9_depthwise/depthwise*model1/block_9_depthwise_BN/ReadVariableOp,model1/block_9_depthwise_BN/ReadVariableOp_1;model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp=model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
f
!model1/block_9_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#model1/block_9_depthwise_relu/Relu6Relu6,model1/block_9_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
,model1/block_9_project/Conv2D/ReadVariableOpReadVariableOpblock_9_project/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_9_project/Conv2DConv2D#model1/block_9_depthwise_relu/Relu6,model1/block_9_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
}
(model1/block_9_project_BN/ReadVariableOpReadVariableOpblock_9_project_BN/gamma*
dtype0*
_output_shapes
:
~
*model1/block_9_project_BN/ReadVariableOp_1ReadVariableOpblock_9_project_BN/beta*
dtype0*
_output_shapes
:
?
9model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
;model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_9_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
*model1/block_9_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_9_project/Conv2D(model1/block_9_project_BN/ReadVariableOp*model1/block_9_project_BN/ReadVariableOp_19model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOp;model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
d
model1/block_9_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_9_add/addAddV2model1/block_8_add/add*model1/block_9_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
,model1/block_10_expand/Conv2D/ReadVariableOpReadVariableOpblock_10_expand/kernel*
dtype0*'
_output_shapes
:?
?
model1/block_10_expand/Conv2DConv2Dmodel1/block_9_add/add,model1/block_10_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
~
(model1/block_10_expand_BN/ReadVariableOpReadVariableOpblock_10_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_10_expand_BN/ReadVariableOp_1ReadVariableOpblock_10_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_10_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_10_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_10_expand/Conv2D(model1/block_10_expand_BN/ReadVariableOp*model1/block_10_expand_BN/ReadVariableOp_19model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
d
model1/block_10_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
!model1/block_10_expand_relu/Relu6Relu6*model1/block_10_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
2model1/block_10_depthwise/depthwise/ReadVariableOpReadVariableOp#block_10_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_10_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
?
1model1/block_10_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_10_depthwise/depthwiseDepthwiseConv2dNative!model1/block_10_expand_relu/Relu62model1/block_10_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+model1/block_10_depthwise_BN/ReadVariableOpReadVariableOpblock_10_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_10_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_10_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_10_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_10_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_10_depthwise/depthwise+model1/block_10_depthwise_BN/ReadVariableOp-model1/block_10_depthwise_BN/ReadVariableOp_1<model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
g
"model1/block_10_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$model1/block_10_depthwise_relu/Relu6Relu6-model1/block_10_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
-model1/block_10_project/Conv2D/ReadVariableOpReadVariableOpblock_10_project/kernel*
dtype0*'
_output_shapes
:? 
?
model1/block_10_project/Conv2DConv2D$model1/block_10_depthwise_relu/Relu6-model1/block_10_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:????????? *
paddingSAME

)model1/block_10_project_BN/ReadVariableOpReadVariableOpblock_10_project_BN/gamma*
dtype0*
_output_shapes
: 
?
+model1/block_10_project_BN/ReadVariableOp_1ReadVariableOpblock_10_project_BN/beta*
dtype0*
_output_shapes
: 
?
:model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
<model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_10_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
+model1/block_10_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_10_project/Conv2D)model1/block_10_project_BN/ReadVariableOp+model1/block_10_project_BN/ReadVariableOp_1:model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( *
epsilon%o?:
e
 model1/block_10_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
,model1/block_11_expand/Conv2D/ReadVariableOpReadVariableOpblock_11_expand/kernel*
dtype0*'
_output_shapes
: ?
?
model1/block_11_expand/Conv2DConv2D+model1/block_10_project_BN/FusedBatchNormV3,model1/block_11_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
~
(model1/block_11_expand_BN/ReadVariableOpReadVariableOpblock_11_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_11_expand_BN/ReadVariableOp_1ReadVariableOpblock_11_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_11_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_11_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_11_expand/Conv2D(model1/block_11_expand_BN/ReadVariableOp*model1/block_11_expand_BN/ReadVariableOp_19model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
d
model1/block_11_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
!model1/block_11_expand_relu/Relu6Relu6*model1/block_11_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
2model1/block_11_depthwise/depthwise/ReadVariableOpReadVariableOp#block_11_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_11_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
1model1/block_11_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_11_depthwise/depthwiseDepthwiseConv2dNative!model1/block_11_expand_relu/Relu62model1/block_11_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+model1/block_11_depthwise_BN/ReadVariableOpReadVariableOpblock_11_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_11_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_11_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_11_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_11_depthwise/depthwise+model1/block_11_depthwise_BN/ReadVariableOp-model1/block_11_depthwise_BN/ReadVariableOp_1<model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
g
"model1/block_11_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
$model1/block_11_depthwise_relu/Relu6Relu6-model1/block_11_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
-model1/block_11_project/Conv2D/ReadVariableOpReadVariableOpblock_11_project/kernel*
dtype0*'
_output_shapes
:? 
?
model1/block_11_project/Conv2DConv2D$model1/block_11_depthwise_relu/Relu6-model1/block_11_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:????????? 

)model1/block_11_project_BN/ReadVariableOpReadVariableOpblock_11_project_BN/gamma*
dtype0*
_output_shapes
: 
?
+model1/block_11_project_BN/ReadVariableOp_1ReadVariableOpblock_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
:model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
<model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_11_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
+model1/block_11_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_11_project/Conv2D)model1/block_11_project_BN/ReadVariableOp+model1/block_11_project_BN/ReadVariableOp_1:model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( 
e
 model1/block_11_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
model1/block_11_add/addAddV2+model1/block_10_project_BN/FusedBatchNormV3+model1/block_11_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:????????? 
?
,model1/block_12_expand/Conv2D/ReadVariableOpReadVariableOpblock_12_expand/kernel*
dtype0*'
_output_shapes
: ?
?
model1/block_12_expand/Conv2DConv2Dmodel1/block_11_add/add,model1/block_12_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
~
(model1/block_12_expand_BN/ReadVariableOpReadVariableOpblock_12_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_12_expand_BN/ReadVariableOp_1ReadVariableOpblock_12_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_12_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_12_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_12_expand/Conv2D(model1/block_12_expand_BN/ReadVariableOp*model1/block_12_expand_BN/ReadVariableOp_19model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
d
model1/block_12_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
!model1/block_12_expand_relu/Relu6Relu6*model1/block_12_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
2model1/block_12_depthwise/depthwise/ReadVariableOpReadVariableOp#block_12_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_12_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
?
1model1/block_12_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
#model1/block_12_depthwise/depthwiseDepthwiseConv2dNative!model1/block_12_expand_relu/Relu62model1/block_12_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+model1/block_12_depthwise_BN/ReadVariableOpReadVariableOpblock_12_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_12_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_12_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_12_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_12_depthwise/depthwise+model1/block_12_depthwise_BN/ReadVariableOp-model1/block_12_depthwise_BN/ReadVariableOp_1<model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:*
T0*
U0
g
"model1/block_12_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$model1/block_12_depthwise_relu/Relu6Relu6-model1/block_12_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
-model1/block_12_project/Conv2D/ReadVariableOpReadVariableOpblock_12_project/kernel*
dtype0*'
_output_shapes
:? 
?
model1/block_12_project/Conv2DConv2D$model1/block_12_depthwise_relu/Relu6-model1/block_12_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:????????? *
paddingSAME

)model1/block_12_project_BN/ReadVariableOpReadVariableOpblock_12_project_BN/gamma*
dtype0*
_output_shapes
: 
?
+model1/block_12_project_BN/ReadVariableOp_1ReadVariableOpblock_12_project_BN/beta*
dtype0*
_output_shapes
: 
?
:model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
<model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
+model1/block_12_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_12_project/Conv2D)model1/block_12_project_BN/ReadVariableOp+model1/block_12_project_BN/ReadVariableOp_1:model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( *
epsilon%o?:
e
 model1/block_12_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
model1/block_12_add/addAddV2model1/block_11_add/add+model1/block_12_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:????????? 
?
,model1/block_13_expand/Conv2D/ReadVariableOpReadVariableOpblock_13_expand/kernel*
dtype0*'
_output_shapes
: ?
?
model1/block_13_expand/Conv2DConv2Dmodel1/block_12_add/add,model1/block_13_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
~
(model1/block_13_expand_BN/ReadVariableOpReadVariableOpblock_13_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_13_expand_BN/ReadVariableOp_1ReadVariableOpblock_13_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_13_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_13_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_13_expand/Conv2D(model1/block_13_expand_BN/ReadVariableOp*model1/block_13_expand_BN/ReadVariableOp_19model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
d
model1/block_13_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
!model1/block_13_expand_relu/Relu6Relu6*model1/block_13_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
 model1/block_13_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
model1/block_13_pad/PadPad!model1/block_13_expand_relu/Relu6 model1/block_13_pad/Pad/paddings*0
_output_shapes
:??????????*
T0
?
2model1/block_13_depthwise/depthwise/ReadVariableOpReadVariableOp#block_13_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_13_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
1model1/block_13_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_13_depthwise/depthwiseDepthwiseConv2dNativemodel1/block_13_pad/Pad2model1/block_13_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingVALID
?
+model1/block_13_depthwise_BN/ReadVariableOpReadVariableOpblock_13_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_13_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_13_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_13_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_13_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_13_depthwise/depthwise+model1/block_13_depthwise_BN/ReadVariableOp-model1/block_13_depthwise_BN/ReadVariableOp_1<model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
g
"model1/block_13_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$model1/block_13_depthwise_relu/Relu6Relu6-model1/block_13_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
-model1/block_13_project/Conv2D/ReadVariableOpReadVariableOpblock_13_project/kernel*
dtype0*'
_output_shapes
:?8
?
model1/block_13_project/Conv2DConv2D$model1/block_13_depthwise_relu/Relu6-model1/block_13_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????8*
paddingSAME

)model1/block_13_project_BN/ReadVariableOpReadVariableOpblock_13_project_BN/gamma*
dtype0*
_output_shapes
:8
?
+model1/block_13_project_BN/ReadVariableOp_1ReadVariableOpblock_13_project_BN/beta*
dtype0*
_output_shapes
:8
?
:model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
<model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_13_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
+model1/block_13_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_13_project/Conv2D)model1/block_13_project_BN/ReadVariableOp+model1/block_13_project_BN/ReadVariableOp_1:model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????8:8:8:8:8:*
epsilon%o?:
e
 model1/block_13_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
,model1/block_14_expand/Conv2D/ReadVariableOpReadVariableOpblock_14_expand/kernel*
dtype0*'
_output_shapes
:8?
?
model1/block_14_expand/Conv2DConv2D+model1/block_13_project_BN/FusedBatchNormV3,model1/block_14_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
~
(model1/block_14_expand_BN/ReadVariableOpReadVariableOpblock_14_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_14_expand_BN/ReadVariableOp_1ReadVariableOpblock_14_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_14_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_14_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_14_expand/Conv2D(model1/block_14_expand_BN/ReadVariableOp*model1/block_14_expand_BN/ReadVariableOp_19model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:*
T0*
U0
d
model1/block_14_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
!model1/block_14_expand_relu/Relu6Relu6*model1/block_14_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
2model1/block_14_depthwise/depthwise/ReadVariableOpReadVariableOp#block_14_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_14_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
?
1model1/block_14_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_14_depthwise/depthwiseDepthwiseConv2dNative!model1/block_14_expand_relu/Relu62model1/block_14_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
+model1/block_14_depthwise_BN/ReadVariableOpReadVariableOpblock_14_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_14_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_14_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_14_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_14_depthwise/depthwise+model1/block_14_depthwise_BN/ReadVariableOp-model1/block_14_depthwise_BN/ReadVariableOp_1<model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
g
"model1/block_14_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$model1/block_14_depthwise_relu/Relu6Relu6-model1/block_14_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
-model1/block_14_project/Conv2D/ReadVariableOpReadVariableOpblock_14_project/kernel*
dtype0*'
_output_shapes
:?8
?
model1/block_14_project/Conv2DConv2D$model1/block_14_depthwise_relu/Relu6-model1/block_14_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????8

)model1/block_14_project_BN/ReadVariableOpReadVariableOpblock_14_project_BN/gamma*
dtype0*
_output_shapes
:8
?
+model1/block_14_project_BN/ReadVariableOp_1ReadVariableOpblock_14_project_BN/beta*
dtype0*
_output_shapes
:8
?
:model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
<model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_14_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
+model1/block_14_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_14_project/Conv2D)model1/block_14_project_BN/ReadVariableOp+model1/block_14_project_BN/ReadVariableOp_1:model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????8:8:8:8:8:
e
 model1/block_14_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
model1/block_14_add/addAddV2+model1/block_13_project_BN/FusedBatchNormV3+model1/block_14_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????8
?
,model1/block_15_expand/Conv2D/ReadVariableOpReadVariableOpblock_15_expand/kernel*
dtype0*'
_output_shapes
:8?
?
model1/block_15_expand/Conv2DConv2Dmodel1/block_14_add/add,model1/block_15_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
~
(model1/block_15_expand_BN/ReadVariableOpReadVariableOpblock_15_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_15_expand_BN/ReadVariableOp_1ReadVariableOpblock_15_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_15_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_15_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_15_expand/Conv2D(model1/block_15_expand_BN/ReadVariableOp*model1/block_15_expand_BN/ReadVariableOp_19model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
d
model1/block_15_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
!model1/block_15_expand_relu/Relu6Relu6*model1/block_15_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
2model1/block_15_depthwise/depthwise/ReadVariableOpReadVariableOp#block_15_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_15_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      P     
?
1model1/block_15_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_15_depthwise/depthwiseDepthwiseConv2dNative!model1/block_15_expand_relu/Relu62model1/block_15_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+model1/block_15_depthwise_BN/ReadVariableOpReadVariableOpblock_15_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_15_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_15_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_15_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_15_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_15_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_15_depthwise/depthwise+model1/block_15_depthwise_BN/ReadVariableOp-model1/block_15_depthwise_BN/ReadVariableOp_1<model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
g
"model1/block_15_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$model1/block_15_depthwise_relu/Relu6Relu6-model1/block_15_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
-model1/block_15_project/Conv2D/ReadVariableOpReadVariableOpblock_15_project/kernel*
dtype0*'
_output_shapes
:?8
?
model1/block_15_project/Conv2DConv2D$model1/block_15_depthwise_relu/Relu6-model1/block_15_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????8*
paddingSAME

)model1/block_15_project_BN/ReadVariableOpReadVariableOpblock_15_project_BN/gamma*
dtype0*
_output_shapes
:8
?
+model1/block_15_project_BN/ReadVariableOp_1ReadVariableOpblock_15_project_BN/beta*
dtype0*
_output_shapes
:8
?
:model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
<model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_15_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
+model1/block_15_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_15_project/Conv2D)model1/block_15_project_BN/ReadVariableOp+model1/block_15_project_BN/ReadVariableOp_1:model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????8:8:8:8:8:*
is_training( *
epsilon%o?:*
T0*
U0
e
 model1/block_15_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
model1/block_15_add/addAddV2model1/block_14_add/add+model1/block_15_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????8
?
,model1/block_16_expand/Conv2D/ReadVariableOpReadVariableOpblock_16_expand/kernel*
dtype0*'
_output_shapes
:8?
?
model1/block_16_expand/Conv2DConv2Dmodel1/block_15_add/add,model1/block_16_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
~
(model1/block_16_expand_BN/ReadVariableOpReadVariableOpblock_16_expand_BN/gamma*
dtype0*
_output_shapes	
:?

*model1/block_16_expand_BN/ReadVariableOp_1ReadVariableOpblock_16_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
9model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
;model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_16_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
*model1/block_16_expand_BN/FusedBatchNormV3FusedBatchNormV3model1/block_16_expand/Conv2D(model1/block_16_expand_BN/ReadVariableOp*model1/block_16_expand_BN/ReadVariableOp_19model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOp;model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
d
model1/block_16_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
!model1/block_16_expand_relu/Relu6Relu6*model1/block_16_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
2model1/block_16_depthwise/depthwise/ReadVariableOpReadVariableOp#block_16_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
)model1/block_16_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      P     
?
1model1/block_16_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
#model1/block_16_depthwise/depthwiseDepthwiseConv2dNative!model1/block_16_expand_relu/Relu62model1/block_16_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
+model1/block_16_depthwise_BN/ReadVariableOpReadVariableOpblock_16_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
-model1/block_16_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_16_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
<model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_16_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
>model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
-model1/block_16_depthwise_BN/FusedBatchNormV3FusedBatchNormV3#model1/block_16_depthwise/depthwise+model1/block_16_depthwise_BN/ReadVariableOp-model1/block_16_depthwise_BN/ReadVariableOp_1<model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp>model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
g
"model1/block_16_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
$model1/block_16_depthwise_relu/Relu6Relu6-model1/block_16_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
-model1/block_16_project/Conv2D/ReadVariableOpReadVariableOpblock_16_project/kernel*
dtype0*'
_output_shapes
:?p
?
model1/block_16_project/Conv2DConv2D$model1/block_16_depthwise_relu/Relu6-model1/block_16_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????p

)model1/block_16_project_BN/ReadVariableOpReadVariableOpblock_16_project_BN/gamma*
dtype0*
_output_shapes
:p
?
+model1/block_16_project_BN/ReadVariableOp_1ReadVariableOpblock_16_project_BN/beta*
dtype0*
_output_shapes
:p
?
:model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_project_BN/moving_mean*
dtype0*
_output_shapes
:p
?
<model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_16_project_BN/moving_variance*
dtype0*
_output_shapes
:p
?
+model1/block_16_project_BN/FusedBatchNormV3FusedBatchNormV3model1/block_16_project/Conv2D)model1/block_16_project_BN/ReadVariableOp+model1/block_16_project_BN/ReadVariableOp_1:model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOp<model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????p:p:p:p:p:*
is_training( 
e
 model1/block_16_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
z
#model1/Conv_1/Conv2D/ReadVariableOpReadVariableOpConv_1/kernel*
dtype0*'
_output_shapes
:p?

?
model1/Conv_1/Conv2DConv2D+model1/block_16_project_BN/FusedBatchNormV3#model1/Conv_1/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????
*
paddingVALID*
T0
l
model1/Conv_1_bn/ReadVariableOpReadVariableOpConv_1_bn/gamma*
dtype0*
_output_shapes	
:?

m
!model1/Conv_1_bn/ReadVariableOp_1ReadVariableOpConv_1_bn/beta*
dtype0*
_output_shapes	
:?

?
0model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOpReadVariableOpConv_1_bn/moving_mean*
dtype0*
_output_shapes	
:?

?
2model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpConv_1_bn/moving_variance*
dtype0*
_output_shapes	
:?

?
!model1/Conv_1_bn/FusedBatchNormV3FusedBatchNormV3model1/Conv_1/Conv2Dmodel1/Conv_1_bn/ReadVariableOp!model1/Conv_1_bn/ReadVariableOp_10model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp2model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????
:?
:?
:?
:?
:*
is_training( 
[
model1/Conv_1_bn/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
|
model1/out_relu/Relu6Relu6!model1/Conv_1_bn/FusedBatchNormV3*0
_output_shapes
:??????????
*
T0
?
Gglobal_average_pooling2d_GlobalAveragePooling2D1/Mean/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB"      
?
5global_average_pooling2d_GlobalAveragePooling2D1/MeanMeanmodel1/out_relu/Relu6Gglobal_average_pooling2d_GlobalAveragePooling2D1/Mean/reduction_indices*
T0*(
_output_shapes
:??????????

w
dense_Dense1_inputPlaceholder*
dtype0*(
_output_shapes
:??????????
*
shape:??????????

?
6dense_Dense1/kernel/Initializer/truncated_normal/shapeConst*
valueB"   d   *&
_class
loc:@dense_Dense1/kernel*
dtype0*
_output_shapes
:
?
5dense_Dense1/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *&
_class
loc:@dense_Dense1/kernel*
dtype0*
_output_shapes
: 
?
7dense_Dense1/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *d'=*&
_class
loc:@dense_Dense1/kernel*
dtype0*
_output_shapes
: 
?
@dense_Dense1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal6dense_Dense1/kernel/Initializer/truncated_normal/shape*
T0*&
_class
loc:@dense_Dense1/kernel*
dtype0*
_output_shapes
:	?
d
?
4dense_Dense1/kernel/Initializer/truncated_normal/mulMul@dense_Dense1/kernel/Initializer/truncated_normal/TruncatedNormal7dense_Dense1/kernel/Initializer/truncated_normal/stddev*
T0*&
_class
loc:@dense_Dense1/kernel*
_output_shapes
:	?
d
?
0dense_Dense1/kernel/Initializer/truncated_normalAdd4dense_Dense1/kernel/Initializer/truncated_normal/mul5dense_Dense1/kernel/Initializer/truncated_normal/mean*
T0*&
_class
loc:@dense_Dense1/kernel*
_output_shapes
:	?
d
?
dense_Dense1/kernelVarHandleOp*&
_class
loc:@dense_Dense1/kernel*
dtype0*
_output_shapes
: *
shape:	?
d*$
shared_namedense_Dense1/kernel
w
4dense_Dense1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_Dense1/kernel*
_output_shapes
: 
?
dense_Dense1/kernel/AssignAssignVariableOpdense_Dense1/kernel0dense_Dense1/kernel/Initializer/truncated_normal*
dtype0
|
'dense_Dense1/kernel/Read/ReadVariableOpReadVariableOpdense_Dense1/kernel*
dtype0*
_output_shapes
:	?
d
?
#dense_Dense1/bias/Initializer/zerosConst*
valueBd*    *$
_class
loc:@dense_Dense1/bias*
dtype0*
_output_shapes
:d
?
dense_Dense1/biasVarHandleOp*
dtype0*
_output_shapes
: *
shape:d*"
shared_namedense_Dense1/bias*$
_class
loc:@dense_Dense1/bias
s
2dense_Dense1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_Dense1/bias*
_output_shapes
: 
q
dense_Dense1/bias/AssignAssignVariableOpdense_Dense1/bias#dense_Dense1/bias/Initializer/zeros*
dtype0
s
%dense_Dense1/bias/Read/ReadVariableOpReadVariableOpdense_Dense1/bias*
dtype0*
_output_shapes
:d
w
"dense_Dense1/MatMul/ReadVariableOpReadVariableOpdense_Dense1/kernel*
dtype0*
_output_shapes
:	?
d
?
dense_Dense1/MatMulMatMuldense_Dense1_input"dense_Dense1/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????d
q
#dense_Dense1/BiasAdd/ReadVariableOpReadVariableOpdense_Dense1/bias*
dtype0*
_output_shapes
:d
?
dense_Dense1/BiasAddBiasAdddense_Dense1/MatMul#dense_Dense1/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????d
a
dense_Dense1/ReluReludense_Dense1/BiasAdd*
T0*'
_output_shapes
:?????????d
?
6dense_Dense2/kernel/Initializer/truncated_normal/shapeConst*
valueB"d      *&
_class
loc:@dense_Dense2/kernel*
dtype0*
_output_shapes
:
?
5dense_Dense2/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *&
_class
loc:@dense_Dense2/kernel*
dtype0*
_output_shapes
: 
?
7dense_Dense2/kernel/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *???=*&
_class
loc:@dense_Dense2/kernel
?
@dense_Dense2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal6dense_Dense2/kernel/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:d*
T0*&
_class
loc:@dense_Dense2/kernel
?
4dense_Dense2/kernel/Initializer/truncated_normal/mulMul@dense_Dense2/kernel/Initializer/truncated_normal/TruncatedNormal7dense_Dense2/kernel/Initializer/truncated_normal/stddev*
T0*&
_class
loc:@dense_Dense2/kernel*
_output_shapes

:d
?
0dense_Dense2/kernel/Initializer/truncated_normalAdd4dense_Dense2/kernel/Initializer/truncated_normal/mul5dense_Dense2/kernel/Initializer/truncated_normal/mean*
T0*&
_class
loc:@dense_Dense2/kernel*
_output_shapes

:d
?
dense_Dense2/kernelVarHandleOp*$
shared_namedense_Dense2/kernel*&
_class
loc:@dense_Dense2/kernel*
dtype0*
_output_shapes
: *
shape
:d
w
4dense_Dense2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_Dense2/kernel*
_output_shapes
: 
?
dense_Dense2/kernel/AssignAssignVariableOpdense_Dense2/kernel0dense_Dense2/kernel/Initializer/truncated_normal*
dtype0
{
'dense_Dense2/kernel/Read/ReadVariableOpReadVariableOpdense_Dense2/kernel*
dtype0*
_output_shapes

:d
v
"dense_Dense2/MatMul/ReadVariableOpReadVariableOpdense_Dense2/kernel*
dtype0*
_output_shapes

:d
?
dense_Dense2/MatMulMatMuldense_Dense1/Relu"dense_Dense2/MatMul/ReadVariableOp*'
_output_shapes
:?????????*
T0
f
dense_Dense2/SoftmaxSoftmaxdense_Dense2/MatMul*
T0*'
_output_shapes
:?????????
?
*sequential_1/model1/Conv1_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
!sequential_1/model1/Conv1_pad/PadPadsequential_1_input*sequential_1/model1/Conv1_pad/Pad/paddings*1
_output_shapes
:???????????*
T0
?
/sequential_1/model1/Conv1/Conv2D/ReadVariableOpReadVariableOpConv1/kernel*
dtype0*&
_output_shapes
:
?
 sequential_1/model1/Conv1/Conv2DConv2D!sequential_1/model1/Conv1_pad/Pad/sequential_1/model1/Conv1/Conv2D/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????pp
v
+sequential_1/model1/bn_Conv1/ReadVariableOpReadVariableOpbn_Conv1/gamma*
dtype0*
_output_shapes
:
w
-sequential_1/model1/bn_Conv1/ReadVariableOp_1ReadVariableOpbn_Conv1/beta*
dtype0*
_output_shapes
:
?
<sequential_1/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOpReadVariableOpbn_Conv1/moving_mean*
dtype0*
_output_shapes
:
?
>sequential_1/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpbn_Conv1/moving_variance*
dtype0*
_output_shapes
:
?
-sequential_1/model1/bn_Conv1/FusedBatchNormV3FusedBatchNormV3 sequential_1/model1/Conv1/Conv2D+sequential_1/model1/bn_Conv1/ReadVariableOp-sequential_1/model1/bn_Conv1/ReadVariableOp_1<sequential_1/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp>sequential_1/model1/bn_Conv1/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????pp:::::*
epsilon%o?:*
T0*
U0
g
"sequential_1/model1/bn_Conv1/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
$sequential_1/model1/Conv1_relu/Relu6Relu6-sequential_1/model1/bn_Conv1/FusedBatchNormV3*/
_output_shapes
:?????????pp*
T0
?
Dsequential_1/model1/expanded_conv_depthwise/depthwise/ReadVariableOpReadVariableOp(expanded_conv_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:
?
;sequential_1/model1/expanded_conv_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"            
?
Csequential_1/model1/expanded_conv_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
5sequential_1/model1/expanded_conv_depthwise/depthwiseDepthwiseConv2dNative$sequential_1/model1/Conv1_relu/Relu6Dsequential_1/model1/expanded_conv_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????pp*
paddingSAME
?
=sequential_1/model1/expanded_conv_depthwise_BN/ReadVariableOpReadVariableOp expanded_conv_depthwise_BN/gamma*
dtype0*
_output_shapes
:
?
?sequential_1/model1/expanded_conv_depthwise_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_depthwise_BN/beta*
dtype0*
_output_shapes
:
?
Nsequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp&expanded_conv_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:
?
Psequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*expanded_conv_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:
?
?sequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3FusedBatchNormV35sequential_1/model1/expanded_conv_depthwise/depthwise=sequential_1/model1/expanded_conv_depthwise_BN/ReadVariableOp?sequential_1/model1/expanded_conv_depthwise_BN/ReadVariableOp_1Nsequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOpPsequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????pp:::::*
epsilon%o?:
y
4sequential_1/model1/expanded_conv_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
6sequential_1/model1/expanded_conv_depthwise_relu/Relu6Relu6?sequential_1/model1/expanded_conv_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp
?
?sequential_1/model1/expanded_conv_project/Conv2D/ReadVariableOpReadVariableOpexpanded_conv_project/kernel*
dtype0*&
_output_shapes
:
?
0sequential_1/model1/expanded_conv_project/Conv2DConv2D6sequential_1/model1/expanded_conv_depthwise_relu/Relu6?sequential_1/model1/expanded_conv_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????pp
?
;sequential_1/model1/expanded_conv_project_BN/ReadVariableOpReadVariableOpexpanded_conv_project_BN/gamma*
dtype0*
_output_shapes
:
?
=sequential_1/model1/expanded_conv_project_BN/ReadVariableOp_1ReadVariableOpexpanded_conv_project_BN/beta*
dtype0*
_output_shapes
:
?
Lsequential_1/model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp$expanded_conv_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Nsequential_1/model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp(expanded_conv_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
=sequential_1/model1/expanded_conv_project_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/expanded_conv_project/Conv2D;sequential_1/model1/expanded_conv_project_BN/ReadVariableOp=sequential_1/model1/expanded_conv_project_BN/ReadVariableOp_1Lsequential_1/model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOpNsequential_1/model1/expanded_conv_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????pp:::::*
epsilon%o?:
w
2sequential_1/model1/expanded_conv_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
8sequential_1/model1/block_1_expand/Conv2D/ReadVariableOpReadVariableOpblock_1_expand/kernel*
dtype0*&
_output_shapes
:0
?
)sequential_1/model1/block_1_expand/Conv2DConv2D=sequential_1/model1/expanded_conv_project_BN/FusedBatchNormV38sequential_1/model1/block_1_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????pp0
?
4sequential_1/model1/block_1_expand_BN/ReadVariableOpReadVariableOpblock_1_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_1_expand_BN/ReadVariableOp_1ReadVariableOpblock_1_expand_BN/beta*
dtype0*
_output_shapes
:0
?
Esequential_1/model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Gsequential_1/model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_1_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_1_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_1_expand/Conv2D4sequential_1/model1/block_1_expand_BN/ReadVariableOp6sequential_1/model1/block_1_expand_BN/ReadVariableOp_1Esequential_1/model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_1_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????pp0:0:0:0:0:*
is_training( 
p
+sequential_1/model1/block_1_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_1_expand_relu/Relu6Relu66sequential_1/model1/block_1_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????pp0
?
,sequential_1/model1/block_1_pad/Pad/paddingsConst*
dtype0*
_output_shapes

:*9
value0B."                               
?
#sequential_1/model1/block_1_pad/PadPad-sequential_1/model1/block_1_expand_relu/Relu6,sequential_1/model1/block_1_pad/Pad/paddings*/
_output_shapes
:?????????qq0*
T0
?
>sequential_1/model1/block_1_depthwise/depthwise/ReadVariableOpReadVariableOp"block_1_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
5sequential_1/model1/block_1_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_1_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
/sequential_1/model1/block_1_depthwise/depthwiseDepthwiseConv2dNative#sequential_1/model1/block_1_pad/Pad>sequential_1/model1/block_1_depthwise/depthwise/ReadVariableOp*
paddingVALID*
T0*
strides
*/
_output_shapes
:?????????880
?
7sequential_1/model1/block_1_depthwise_BN/ReadVariableOpReadVariableOpblock_1_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_1_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_1_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
Hsequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_1_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Jsequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_1_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_1_depthwise/depthwise7sequential_1/model1/block_1_depthwise_BN/ReadVariableOp9sequential_1/model1/block_1_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( *
epsilon%o?:
s
.sequential_1/model1/block_1_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_1_depthwise_relu/Relu6Relu69sequential_1/model1/block_1_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????880*
T0
?
9sequential_1/model1/block_1_project/Conv2D/ReadVariableOpReadVariableOpblock_1_project/kernel*
dtype0*&
_output_shapes
:0
?
*sequential_1/model1/block_1_project/Conv2DConv2D0sequential_1/model1/block_1_depthwise_relu/Relu69sequential_1/model1/block_1_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????88
?
5sequential_1/model1/block_1_project_BN/ReadVariableOpReadVariableOpblock_1_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_1_project_BN/ReadVariableOp_1ReadVariableOpblock_1_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_1_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_1_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_1_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_1_project/Conv2D5sequential_1/model1/block_1_project_BN/ReadVariableOp7sequential_1/model1/block_1_project_BN/ReadVariableOp_1Fsequential_1/model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_1_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????88:::::*
is_training( 
q
,sequential_1/model1/block_1_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_2_expand/Conv2D/ReadVariableOpReadVariableOpblock_2_expand/kernel*
dtype0*&
_output_shapes
:0
?
)sequential_1/model1/block_2_expand/Conv2DConv2D7sequential_1/model1/block_1_project_BN/FusedBatchNormV38sequential_1/model1/block_2_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????880*
paddingSAME
?
4sequential_1/model1/block_2_expand_BN/ReadVariableOpReadVariableOpblock_2_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_2_expand_BN/ReadVariableOp_1ReadVariableOpblock_2_expand_BN/beta*
dtype0*
_output_shapes
:0
?
Esequential_1/model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Gsequential_1/model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_2_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_2_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_2_expand/Conv2D4sequential_1/model1/block_2_expand_BN/ReadVariableOp6sequential_1/model1/block_2_expand_BN/ReadVariableOp_1Esequential_1/model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_2_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????880:0:0:0:0:*
is_training( 
p
+sequential_1/model1/block_2_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
-sequential_1/model1/block_2_expand_relu/Relu6Relu66sequential_1/model1/block_2_expand_BN/FusedBatchNormV3*/
_output_shapes
:?????????880*
T0
?
>sequential_1/model1/block_2_depthwise/depthwise/ReadVariableOpReadVariableOp"block_2_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
5sequential_1/model1/block_2_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_2_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_2_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_2_expand_relu/Relu6>sequential_1/model1/block_2_depthwise/depthwise/ReadVariableOp*
strides
*/
_output_shapes
:?????????880*
paddingSAME*
T0
?
7sequential_1/model1/block_2_depthwise_BN/ReadVariableOpReadVariableOpblock_2_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_2_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_2_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
Hsequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_2_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Jsequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_2_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_2_depthwise/depthwise7sequential_1/model1/block_2_depthwise_BN/ReadVariableOp9sequential_1/model1/block_2_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????880:0:0:0:0:*
epsilon%o?:*
T0*
U0
s
.sequential_1/model1/block_2_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
0sequential_1/model1/block_2_depthwise_relu/Relu6Relu69sequential_1/model1/block_2_depthwise_BN/FusedBatchNormV3*/
_output_shapes
:?????????880*
T0
?
9sequential_1/model1/block_2_project/Conv2D/ReadVariableOpReadVariableOpblock_2_project/kernel*
dtype0*&
_output_shapes
:0
?
*sequential_1/model1/block_2_project/Conv2DConv2D0sequential_1/model1/block_2_depthwise_relu/Relu69sequential_1/model1/block_2_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????88
?
5sequential_1/model1/block_2_project_BN/ReadVariableOpReadVariableOpblock_2_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_2_project_BN/ReadVariableOp_1ReadVariableOpblock_2_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_2_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_2_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_2_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_2_project/Conv2D5sequential_1/model1/block_2_project_BN/ReadVariableOp7sequential_1/model1/block_2_project_BN/ReadVariableOp_1Fsequential_1/model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_2_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????88:::::*
is_training( *
epsilon%o?:
q
,sequential_1/model1/block_2_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#sequential_1/model1/block_2_add/addAddV27sequential_1/model1/block_1_project_BN/FusedBatchNormV37sequential_1/model1/block_2_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????88
?
8sequential_1/model1/block_3_expand/Conv2D/ReadVariableOpReadVariableOpblock_3_expand/kernel*
dtype0*&
_output_shapes
:0
?
)sequential_1/model1/block_3_expand/Conv2DConv2D#sequential_1/model1/block_2_add/add8sequential_1/model1/block_3_expand/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????880*
paddingSAME
?
4sequential_1/model1/block_3_expand_BN/ReadVariableOpReadVariableOpblock_3_expand_BN/gamma*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_3_expand_BN/ReadVariableOp_1ReadVariableOpblock_3_expand_BN/beta*
dtype0*
_output_shapes
:0
?
Esequential_1/model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_expand_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Gsequential_1/model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_3_expand_BN/moving_variance*
dtype0*
_output_shapes
:0
?
6sequential_1/model1/block_3_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_3_expand/Conv2D4sequential_1/model1/block_3_expand_BN/ReadVariableOp6sequential_1/model1/block_3_expand_BN/ReadVariableOp_1Esequential_1/model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_3_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????880:0:0:0:0:
p
+sequential_1/model1/block_3_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_3_expand_relu/Relu6Relu66sequential_1/model1/block_3_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????880
?
,sequential_1/model1/block_3_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
#sequential_1/model1/block_3_pad/PadPad-sequential_1/model1/block_3_expand_relu/Relu6,sequential_1/model1/block_3_pad/Pad/paddings*
T0*/
_output_shapes
:?????????990
?
>sequential_1/model1/block_3_depthwise/depthwise/ReadVariableOpReadVariableOp"block_3_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:0
?
5sequential_1/model1/block_3_depthwise/depthwise/ShapeConst*%
valueB"      0      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_3_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_3_depthwise/depthwiseDepthwiseConv2dNative#sequential_1/model1/block_3_pad/Pad>sequential_1/model1/block_3_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????0*
paddingVALID
?
7sequential_1/model1/block_3_depthwise_BN/ReadVariableOpReadVariableOpblock_3_depthwise_BN/gamma*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_3_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_3_depthwise_BN/beta*
dtype0*
_output_shapes
:0
?
Hsequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_3_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:0
?
Jsequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_3_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:0
?
9sequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_3_depthwise/depthwise7sequential_1/model1/block_3_depthwise_BN/ReadVariableOp9sequential_1/model1/block_3_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????0:0:0:0:0:*
is_training( 
s
.sequential_1/model1/block_3_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
0sequential_1/model1/block_3_depthwise_relu/Relu6Relu69sequential_1/model1/block_3_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????0
?
9sequential_1/model1/block_3_project/Conv2D/ReadVariableOpReadVariableOpblock_3_project/kernel*
dtype0*&
_output_shapes
:0
?
*sequential_1/model1/block_3_project/Conv2DConv2D0sequential_1/model1/block_3_depthwise_relu/Relu69sequential_1/model1/block_3_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????*
paddingSAME*
T0
?
5sequential_1/model1/block_3_project_BN/ReadVariableOpReadVariableOpblock_3_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_3_project_BN/ReadVariableOp_1ReadVariableOpblock_3_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_3_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_3_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_3_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_3_project/Conv2D5sequential_1/model1/block_3_project_BN/ReadVariableOp7sequential_1/model1/block_3_project_BN/ReadVariableOp_1Fsequential_1/model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_3_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:*
T0*
U0
q
,sequential_1/model1/block_3_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
8sequential_1/model1/block_4_expand/Conv2D/ReadVariableOpReadVariableOpblock_4_expand/kernel*
dtype0*&
_output_shapes
:`
?
)sequential_1/model1/block_4_expand/Conv2DConv2D7sequential_1/model1/block_3_project_BN/FusedBatchNormV38sequential_1/model1/block_4_expand/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
?
4sequential_1/model1/block_4_expand_BN/ReadVariableOpReadVariableOpblock_4_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_4_expand_BN/ReadVariableOp_1ReadVariableOpblock_4_expand_BN/beta*
dtype0*
_output_shapes
:`
?
Esequential_1/model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Gsequential_1/model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_4_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_4_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_4_expand/Conv2D4sequential_1/model1/block_4_expand_BN/ReadVariableOp6sequential_1/model1/block_4_expand_BN/ReadVariableOp_1Esequential_1/model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_4_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( 
p
+sequential_1/model1/block_4_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_4_expand_relu/Relu6Relu66sequential_1/model1/block_4_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
>sequential_1/model1/block_4_depthwise/depthwise/ReadVariableOpReadVariableOp"block_4_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
5sequential_1/model1/block_4_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_4_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_4_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_4_expand_relu/Relu6>sequential_1/model1/block_4_depthwise/depthwise/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingSAME*
T0
?
7sequential_1/model1/block_4_depthwise_BN/ReadVariableOpReadVariableOpblock_4_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_4_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_4_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
Hsequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_4_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Jsequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_4_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_4_depthwise/depthwise7sequential_1/model1/block_4_depthwise_BN/ReadVariableOp9sequential_1/model1/block_4_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:
s
.sequential_1/model1/block_4_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_4_depthwise_relu/Relu6Relu69sequential_1/model1/block_4_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
9sequential_1/model1/block_4_project/Conv2D/ReadVariableOpReadVariableOpblock_4_project/kernel*
dtype0*&
_output_shapes
:`
?
*sequential_1/model1/block_4_project/Conv2DConv2D0sequential_1/model1/block_4_depthwise_relu/Relu69sequential_1/model1/block_4_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
?
5sequential_1/model1/block_4_project_BN/ReadVariableOpReadVariableOpblock_4_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_4_project_BN/ReadVariableOp_1ReadVariableOpblock_4_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_4_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_4_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_4_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_4_project/Conv2D5sequential_1/model1/block_4_project_BN/ReadVariableOp7sequential_1/model1/block_4_project_BN/ReadVariableOp_1Fsequential_1/model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_4_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:
q
,sequential_1/model1/block_4_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#sequential_1/model1/block_4_add/addAddV27sequential_1/model1/block_3_project_BN/FusedBatchNormV37sequential_1/model1/block_4_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????*
T0
?
8sequential_1/model1/block_5_expand/Conv2D/ReadVariableOpReadVariableOpblock_5_expand/kernel*
dtype0*&
_output_shapes
:`
?
)sequential_1/model1/block_5_expand/Conv2DConv2D#sequential_1/model1/block_4_add/add8sequential_1/model1/block_5_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
4sequential_1/model1/block_5_expand_BN/ReadVariableOpReadVariableOpblock_5_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_5_expand_BN/ReadVariableOp_1ReadVariableOpblock_5_expand_BN/beta*
dtype0*
_output_shapes
:`
?
Esequential_1/model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Gsequential_1/model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_5_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_5_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_5_expand/Conv2D4sequential_1/model1/block_5_expand_BN/ReadVariableOp6sequential_1/model1/block_5_expand_BN/ReadVariableOp_1Esequential_1/model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_5_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:?????????`:`:`:`:`:*
is_training( 
p
+sequential_1/model1/block_5_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_5_expand_relu/Relu6Relu66sequential_1/model1/block_5_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
>sequential_1/model1/block_5_depthwise/depthwise/ReadVariableOpReadVariableOp"block_5_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
5sequential_1/model1/block_5_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_5_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_5_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_5_expand_relu/Relu6>sequential_1/model1/block_5_depthwise/depthwise/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????`*
paddingSAME
?
7sequential_1/model1/block_5_depthwise_BN/ReadVariableOpReadVariableOpblock_5_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_5_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_5_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
Hsequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_5_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Jsequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_5_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_5_depthwise/depthwise7sequential_1/model1/block_5_depthwise_BN/ReadVariableOp9sequential_1/model1/block_5_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:*
T0*
U0
s
.sequential_1/model1/block_5_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
0sequential_1/model1/block_5_depthwise_relu/Relu6Relu69sequential_1/model1/block_5_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
9sequential_1/model1/block_5_project/Conv2D/ReadVariableOpReadVariableOpblock_5_project/kernel*
dtype0*&
_output_shapes
:`
?
*sequential_1/model1/block_5_project/Conv2DConv2D0sequential_1/model1/block_5_depthwise_relu/Relu69sequential_1/model1/block_5_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
5sequential_1/model1/block_5_project_BN/ReadVariableOpReadVariableOpblock_5_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_5_project_BN/ReadVariableOp_1ReadVariableOpblock_5_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_5_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_5_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_5_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_5_project/Conv2D5sequential_1/model1/block_5_project_BN/ReadVariableOp7sequential_1/model1/block_5_project_BN/ReadVariableOp_1Fsequential_1/model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_5_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????:::::*
epsilon%o?:*
T0*
U0
q
,sequential_1/model1/block_5_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#sequential_1/model1/block_5_add/addAddV2#sequential_1/model1/block_4_add/add7sequential_1/model1/block_5_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
8sequential_1/model1/block_6_expand/Conv2D/ReadVariableOpReadVariableOpblock_6_expand/kernel*
dtype0*&
_output_shapes
:`
?
)sequential_1/model1/block_6_expand/Conv2DConv2D#sequential_1/model1/block_5_add/add8sequential_1/model1/block_6_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????`
?
4sequential_1/model1/block_6_expand_BN/ReadVariableOpReadVariableOpblock_6_expand_BN/gamma*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_6_expand_BN/ReadVariableOp_1ReadVariableOpblock_6_expand_BN/beta*
dtype0*
_output_shapes
:`
?
Esequential_1/model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_expand_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Gsequential_1/model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_6_expand_BN/moving_variance*
dtype0*
_output_shapes
:`
?
6sequential_1/model1/block_6_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_6_expand/Conv2D4sequential_1/model1/block_6_expand_BN/ReadVariableOp6sequential_1/model1/block_6_expand_BN/ReadVariableOp_1Esequential_1/model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_6_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:
p
+sequential_1/model1/block_6_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_6_expand_relu/Relu6Relu66sequential_1/model1/block_6_expand_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
,sequential_1/model1/block_6_pad/Pad/paddingsConst*
dtype0*
_output_shapes

:*9
value0B."                               
?
#sequential_1/model1/block_6_pad/PadPad-sequential_1/model1/block_6_expand_relu/Relu6,sequential_1/model1/block_6_pad/Pad/paddings*
T0*/
_output_shapes
:?????????`
?
>sequential_1/model1/block_6_depthwise/depthwise/ReadVariableOpReadVariableOp"block_6_depthwise/depthwise_kernel*
dtype0*&
_output_shapes
:`
?
5sequential_1/model1/block_6_depthwise/depthwise/ShapeConst*%
valueB"      `      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_6_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_6_depthwise/depthwiseDepthwiseConv2dNative#sequential_1/model1/block_6_pad/Pad>sequential_1/model1/block_6_depthwise/depthwise/ReadVariableOp*
strides
*/
_output_shapes
:?????????`*
paddingVALID*
T0
?
7sequential_1/model1/block_6_depthwise_BN/ReadVariableOpReadVariableOpblock_6_depthwise_BN/gamma*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_6_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_6_depthwise_BN/beta*
dtype0*
_output_shapes
:`
?
Hsequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_6_depthwise_BN/moving_mean*
dtype0*
_output_shapes
:`
?
Jsequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_6_depthwise_BN/moving_variance*
dtype0*
_output_shapes
:`
?
9sequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_6_depthwise/depthwise7sequential_1/model1/block_6_depthwise_BN/ReadVariableOp9sequential_1/model1/block_6_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????`:`:`:`:`:*
epsilon%o?:
s
.sequential_1/model1/block_6_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_6_depthwise_relu/Relu6Relu69sequential_1/model1/block_6_depthwise_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????`
?
9sequential_1/model1/block_6_project/Conv2D/ReadVariableOpReadVariableOpblock_6_project/kernel*
dtype0*&
_output_shapes
:`
?
*sequential_1/model1/block_6_project/Conv2DConv2D0sequential_1/model1/block_6_depthwise_relu/Relu69sequential_1/model1/block_6_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
5sequential_1/model1/block_6_project_BN/ReadVariableOpReadVariableOpblock_6_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_6_project_BN/ReadVariableOp_1ReadVariableOpblock_6_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_6_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_6_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_6_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_6_project/Conv2D5sequential_1/model1/block_6_project_BN/ReadVariableOp7sequential_1/model1/block_6_project_BN/ReadVariableOp_1Fsequential_1/model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_6_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::
q
,sequential_1/model1/block_6_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_7_expand/Conv2D/ReadVariableOpReadVariableOpblock_7_expand/kernel*
dtype0*'
_output_shapes
:?
?
)sequential_1/model1/block_7_expand/Conv2DConv2D7sequential_1/model1/block_6_project_BN/FusedBatchNormV38sequential_1/model1/block_7_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
4sequential_1/model1/block_7_expand_BN/ReadVariableOpReadVariableOpblock_7_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_7_expand_BN/ReadVariableOp_1ReadVariableOpblock_7_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Esequential_1/model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Gsequential_1/model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_7_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_7_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_7_expand/Conv2D4sequential_1/model1/block_7_expand_BN/ReadVariableOp6sequential_1/model1/block_7_expand_BN/ReadVariableOp_1Esequential_1/model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_7_expand_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
p
+sequential_1/model1/block_7_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_7_expand_relu/Relu6Relu66sequential_1/model1/block_7_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
>sequential_1/model1/block_7_depthwise/depthwise/ReadVariableOpReadVariableOp"block_7_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
5sequential_1/model1/block_7_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_7_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_7_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_7_expand_relu/Relu6>sequential_1/model1/block_7_depthwise/depthwise/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
7sequential_1/model1/block_7_depthwise_BN/ReadVariableOpReadVariableOpblock_7_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_7_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_7_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_7_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Jsequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_7_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_7_depthwise/depthwise7sequential_1/model1/block_7_depthwise_BN/ReadVariableOp9sequential_1/model1/block_7_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
s
.sequential_1/model1/block_7_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_7_depthwise_relu/Relu6Relu69sequential_1/model1/block_7_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
9sequential_1/model1/block_7_project/Conv2D/ReadVariableOpReadVariableOpblock_7_project/kernel*
dtype0*'
_output_shapes
:?
?
*sequential_1/model1/block_7_project/Conv2DConv2D0sequential_1/model1/block_7_depthwise_relu/Relu69sequential_1/model1/block_7_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????*
paddingSAME
?
5sequential_1/model1/block_7_project_BN/ReadVariableOpReadVariableOpblock_7_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_7_project_BN/ReadVariableOp_1ReadVariableOpblock_7_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_7_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_7_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_7_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_7_project/Conv2D5sequential_1/model1/block_7_project_BN/ReadVariableOp7sequential_1/model1/block_7_project_BN/ReadVariableOp_1Fsequential_1/model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_7_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:
q
,sequential_1/model1/block_7_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#sequential_1/model1/block_7_add/addAddV27sequential_1/model1/block_6_project_BN/FusedBatchNormV37sequential_1/model1/block_7_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
8sequential_1/model1/block_8_expand/Conv2D/ReadVariableOpReadVariableOpblock_8_expand/kernel*
dtype0*'
_output_shapes
:?
?
)sequential_1/model1/block_8_expand/Conv2DConv2D#sequential_1/model1/block_7_add/add8sequential_1/model1/block_8_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
4sequential_1/model1/block_8_expand_BN/ReadVariableOpReadVariableOpblock_8_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_8_expand_BN/ReadVariableOp_1ReadVariableOpblock_8_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Esequential_1/model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Gsequential_1/model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_8_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_8_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_8_expand/Conv2D4sequential_1/model1/block_8_expand_BN/ReadVariableOp6sequential_1/model1/block_8_expand_BN/ReadVariableOp_1Esequential_1/model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_8_expand_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
p
+sequential_1/model1/block_8_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_8_expand_relu/Relu6Relu66sequential_1/model1/block_8_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
>sequential_1/model1/block_8_depthwise/depthwise/ReadVariableOpReadVariableOp"block_8_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
5sequential_1/model1/block_8_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
?
=sequential_1/model1/block_8_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_8_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_8_expand_relu/Relu6>sequential_1/model1/block_8_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
7sequential_1/model1/block_8_depthwise_BN/ReadVariableOpReadVariableOpblock_8_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_8_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_8_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_8_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Jsequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_8_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_8_depthwise/depthwise7sequential_1/model1/block_8_depthwise_BN/ReadVariableOp9sequential_1/model1/block_8_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
s
.sequential_1/model1/block_8_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_8_depthwise_relu/Relu6Relu69sequential_1/model1/block_8_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
9sequential_1/model1/block_8_project/Conv2D/ReadVariableOpReadVariableOpblock_8_project/kernel*
dtype0*'
_output_shapes
:?
?
*sequential_1/model1/block_8_project/Conv2DConv2D0sequential_1/model1/block_8_depthwise_relu/Relu69sequential_1/model1/block_8_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
5sequential_1/model1/block_8_project_BN/ReadVariableOpReadVariableOpblock_8_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_8_project_BN/ReadVariableOp_1ReadVariableOpblock_8_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_8_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_8_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_8_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_8_project/Conv2D5sequential_1/model1/block_8_project_BN/ReadVariableOp7sequential_1/model1/block_8_project_BN/ReadVariableOp_1Fsequential_1/model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_8_project_BN/FusedBatchNormV3/ReadVariableOp_1*K
_output_shapes9
7:?????????:::::*
is_training( *
epsilon%o?:*
T0*
U0
q
,sequential_1/model1/block_8_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
#sequential_1/model1/block_8_add/addAddV2#sequential_1/model1/block_7_add/add7sequential_1/model1/block_8_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????*
T0
?
8sequential_1/model1/block_9_expand/Conv2D/ReadVariableOpReadVariableOpblock_9_expand/kernel*
dtype0*'
_output_shapes
:?
?
)sequential_1/model1/block_9_expand/Conv2DConv2D#sequential_1/model1/block_8_add/add8sequential_1/model1/block_9_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
4sequential_1/model1/block_9_expand_BN/ReadVariableOpReadVariableOpblock_9_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_9_expand_BN/ReadVariableOp_1ReadVariableOpblock_9_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Esequential_1/model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Gsequential_1/model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp!block_9_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
6sequential_1/model1/block_9_expand_BN/FusedBatchNormV3FusedBatchNormV3)sequential_1/model1/block_9_expand/Conv2D4sequential_1/model1/block_9_expand_BN/ReadVariableOp6sequential_1/model1/block_9_expand_BN/ReadVariableOp_1Esequential_1/model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOpGsequential_1/model1/block_9_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
p
+sequential_1/model1/block_9_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
-sequential_1/model1/block_9_expand_relu/Relu6Relu66sequential_1/model1/block_9_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
>sequential_1/model1/block_9_depthwise/depthwise/ReadVariableOpReadVariableOp"block_9_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
5sequential_1/model1/block_9_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
=sequential_1/model1/block_9_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
/sequential_1/model1/block_9_depthwise/depthwiseDepthwiseConv2dNative-sequential_1/model1/block_9_expand_relu/Relu6>sequential_1/model1/block_9_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
7sequential_1/model1/block_9_depthwise_BN/ReadVariableOpReadVariableOpblock_9_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_9_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_9_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp block_9_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Jsequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp$block_9_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
9sequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3FusedBatchNormV3/sequential_1/model1/block_9_depthwise/depthwise7sequential_1/model1/block_9_depthwise_BN/ReadVariableOp9sequential_1/model1/block_9_depthwise_BN/ReadVariableOp_1Hsequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOpJsequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:*
T0*
U0
s
.sequential_1/model1/block_9_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/block_9_depthwise_relu/Relu6Relu69sequential_1/model1/block_9_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
9sequential_1/model1/block_9_project/Conv2D/ReadVariableOpReadVariableOpblock_9_project/kernel*
dtype0*'
_output_shapes
:?
?
*sequential_1/model1/block_9_project/Conv2DConv2D0sequential_1/model1/block_9_depthwise_relu/Relu69sequential_1/model1/block_9_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????
?
5sequential_1/model1/block_9_project_BN/ReadVariableOpReadVariableOpblock_9_project_BN/gamma*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_9_project_BN/ReadVariableOp_1ReadVariableOpblock_9_project_BN/beta*
dtype0*
_output_shapes
:
?
Fsequential_1/model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_9_project_BN/moving_mean*
dtype0*
_output_shapes
:
?
Hsequential_1/model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_9_project_BN/moving_variance*
dtype0*
_output_shapes
:
?
7sequential_1/model1/block_9_project_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_9_project/Conv2D5sequential_1/model1/block_9_project_BN/ReadVariableOp7sequential_1/model1/block_9_project_BN/ReadVariableOp_1Fsequential_1/model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_9_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????:::::
q
,sequential_1/model1/block_9_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
#sequential_1/model1/block_9_add/addAddV2#sequential_1/model1/block_8_add/add7sequential_1/model1/block_9_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????
?
9sequential_1/model1/block_10_expand/Conv2D/ReadVariableOpReadVariableOpblock_10_expand/kernel*
dtype0*'
_output_shapes
:?
?
*sequential_1/model1/block_10_expand/Conv2DConv2D#sequential_1/model1/block_9_add/add9sequential_1/model1/block_10_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
5sequential_1/model1/block_10_expand_BN/ReadVariableOpReadVariableOpblock_10_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_10_expand_BN/ReadVariableOp_1ReadVariableOpblock_10_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_10_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_10_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_10_expand/Conv2D5sequential_1/model1/block_10_expand_BN/ReadVariableOp7sequential_1/model1/block_10_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_10_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
q
,sequential_1/model1/block_10_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
.sequential_1/model1/block_10_expand_relu/Relu6Relu67sequential_1/model1/block_10_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_10_depthwise/depthwise/ReadVariableOpReadVariableOp#block_10_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_10_depthwise/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"      ?      
?
>sequential_1/model1/block_10_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_10_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_10_expand_relu/Relu6?sequential_1/model1/block_10_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
8sequential_1/model1/block_10_depthwise_BN/ReadVariableOpReadVariableOpblock_10_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_10_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_10_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_10_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_10_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_10_depthwise/depthwise8sequential_1/model1/block_10_depthwise_BN/ReadVariableOp:sequential_1/model1/block_10_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
t
/sequential_1/model1/block_10_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
1sequential_1/model1/block_10_depthwise_relu/Relu6Relu6:sequential_1/model1/block_10_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_10_project/Conv2D/ReadVariableOpReadVariableOpblock_10_project/kernel*
dtype0*'
_output_shapes
:? 
?
+sequential_1/model1/block_10_project/Conv2DConv2D1sequential_1/model1/block_10_depthwise_relu/Relu6:sequential_1/model1/block_10_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:????????? *
paddingSAME
?
6sequential_1/model1/block_10_project_BN/ReadVariableOpReadVariableOpblock_10_project_BN/gamma*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_10_project_BN/ReadVariableOp_1ReadVariableOpblock_10_project_BN/beta*
dtype0*
_output_shapes
: 
?
Gsequential_1/model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_10_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
Isequential_1/model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_10_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_10_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_10_project/Conv2D6sequential_1/model1/block_10_project_BN/ReadVariableOp8sequential_1/model1/block_10_project_BN/ReadVariableOp_1Gsequential_1/model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_10_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( 
r
-sequential_1/model1/block_10_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
9sequential_1/model1/block_11_expand/Conv2D/ReadVariableOpReadVariableOpblock_11_expand/kernel*
dtype0*'
_output_shapes
: ?
?
*sequential_1/model1/block_11_expand/Conv2DConv2D8sequential_1/model1/block_10_project_BN/FusedBatchNormV39sequential_1/model1/block_11_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
5sequential_1/model1/block_11_expand_BN/ReadVariableOpReadVariableOpblock_11_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_11_expand_BN/ReadVariableOp_1ReadVariableOpblock_11_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_11_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_11_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_11_expand/Conv2D5sequential_1/model1/block_11_expand_BN/ReadVariableOp7sequential_1/model1/block_11_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_11_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:
q
,sequential_1/model1/block_11_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
.sequential_1/model1/block_11_expand_relu/Relu6Relu67sequential_1/model1/block_11_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_11_depthwise/depthwise/ReadVariableOpReadVariableOp#block_11_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_11_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_11_depthwise/depthwise/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
0sequential_1/model1/block_11_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_11_expand_relu/Relu6?sequential_1/model1/block_11_depthwise/depthwise/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
8sequential_1/model1/block_11_depthwise_BN/ReadVariableOpReadVariableOpblock_11_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_11_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_11_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_11_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_11_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_11_depthwise/depthwise8sequential_1/model1/block_11_depthwise_BN/ReadVariableOp:sequential_1/model1/block_11_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
t
/sequential_1/model1/block_11_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
1sequential_1/model1/block_11_depthwise_relu/Relu6Relu6:sequential_1/model1/block_11_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_11_project/Conv2D/ReadVariableOpReadVariableOpblock_11_project/kernel*
dtype0*'
_output_shapes
:? 
?
+sequential_1/model1/block_11_project/Conv2DConv2D1sequential_1/model1/block_11_depthwise_relu/Relu6:sequential_1/model1/block_11_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:????????? 
?
6sequential_1/model1/block_11_project_BN/ReadVariableOpReadVariableOpblock_11_project_BN/gamma*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_11_project_BN/ReadVariableOp_1ReadVariableOpblock_11_project_BN/beta*
dtype0*
_output_shapes
: 
?
Gsequential_1/model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_11_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
Isequential_1/model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_11_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_11_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_11_project/Conv2D6sequential_1/model1/block_11_project_BN/ReadVariableOp8sequential_1/model1/block_11_project_BN/ReadVariableOp_1Gsequential_1/model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_11_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:????????? : : : : :*
is_training( *
epsilon%o?:
r
-sequential_1/model1/block_11_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$sequential_1/model1/block_11_add/addAddV28sequential_1/model1/block_10_project_BN/FusedBatchNormV38sequential_1/model1/block_11_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:????????? 
?
9sequential_1/model1/block_12_expand/Conv2D/ReadVariableOpReadVariableOpblock_12_expand/kernel*
dtype0*'
_output_shapes
: ?
?
*sequential_1/model1/block_12_expand/Conv2DConv2D$sequential_1/model1/block_11_add/add9sequential_1/model1/block_12_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
5sequential_1/model1/block_12_expand_BN/ReadVariableOpReadVariableOpblock_12_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_12_expand_BN/ReadVariableOp_1ReadVariableOpblock_12_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_12_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_12_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_12_expand/Conv2D5sequential_1/model1/block_12_expand_BN/ReadVariableOp7sequential_1/model1/block_12_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_12_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
q
,sequential_1/model1/block_12_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
.sequential_1/model1/block_12_expand_relu/Relu6Relu67sequential_1/model1/block_12_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_12_depthwise/depthwise/ReadVariableOpReadVariableOp#block_12_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_12_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_12_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_12_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_12_expand_relu/Relu6?sequential_1/model1/block_12_depthwise/depthwise/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
8sequential_1/model1/block_12_depthwise_BN/ReadVariableOpReadVariableOpblock_12_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_12_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_12_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_12_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_12_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_12_depthwise/depthwise8sequential_1/model1/block_12_depthwise_BN/ReadVariableOp:sequential_1/model1/block_12_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
t
/sequential_1/model1/block_12_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
1sequential_1/model1/block_12_depthwise_relu/Relu6Relu6:sequential_1/model1/block_12_depthwise_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
:sequential_1/model1/block_12_project/Conv2D/ReadVariableOpReadVariableOpblock_12_project/kernel*
dtype0*'
_output_shapes
:? 
?
+sequential_1/model1/block_12_project/Conv2DConv2D1sequential_1/model1/block_12_depthwise_relu/Relu6:sequential_1/model1/block_12_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:????????? 
?
6sequential_1/model1/block_12_project_BN/ReadVariableOpReadVariableOpblock_12_project_BN/gamma*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_12_project_BN/ReadVariableOp_1ReadVariableOpblock_12_project_BN/beta*
dtype0*
_output_shapes
: 
?
Gsequential_1/model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_12_project_BN/moving_mean*
dtype0*
_output_shapes
: 
?
Isequential_1/model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_12_project_BN/moving_variance*
dtype0*
_output_shapes
: 
?
8sequential_1/model1/block_12_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_12_project/Conv2D6sequential_1/model1/block_12_project_BN/ReadVariableOp8sequential_1/model1/block_12_project_BN/ReadVariableOp_1Gsequential_1/model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_12_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *K
_output_shapes9
7:????????? : : : : :*
epsilon%o?:
r
-sequential_1/model1/block_12_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$sequential_1/model1/block_12_add/addAddV2$sequential_1/model1/block_11_add/add8sequential_1/model1/block_12_project_BN/FusedBatchNormV3*/
_output_shapes
:????????? *
T0
?
9sequential_1/model1/block_13_expand/Conv2D/ReadVariableOpReadVariableOpblock_13_expand/kernel*
dtype0*'
_output_shapes
: ?
?
*sequential_1/model1/block_13_expand/Conv2DConv2D$sequential_1/model1/block_12_add/add9sequential_1/model1/block_13_expand/Conv2D/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
5sequential_1/model1/block_13_expand_BN/ReadVariableOpReadVariableOpblock_13_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_13_expand_BN/ReadVariableOp_1ReadVariableOpblock_13_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_13_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_13_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_13_expand/Conv2D5sequential_1/model1/block_13_expand_BN/ReadVariableOp7sequential_1/model1/block_13_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_13_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
q
,sequential_1/model1/block_13_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
.sequential_1/model1/block_13_expand_relu/Relu6Relu67sequential_1/model1/block_13_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
-sequential_1/model1/block_13_pad/Pad/paddingsConst*9
value0B."                               *
dtype0*
_output_shapes

:
?
$sequential_1/model1/block_13_pad/PadPad.sequential_1/model1/block_13_expand_relu/Relu6-sequential_1/model1/block_13_pad/Pad/paddings*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_13_depthwise/depthwise/ReadVariableOpReadVariableOp#block_13_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_13_depthwise/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_13_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_13_depthwise/depthwiseDepthwiseConv2dNative$sequential_1/model1/block_13_pad/Pad?sequential_1/model1/block_13_depthwise/depthwise/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingVALID*
T0
?
8sequential_1/model1/block_13_depthwise_BN/ReadVariableOpReadVariableOpblock_13_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_13_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_13_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_13_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_13_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_13_depthwise/depthwise8sequential_1/model1/block_13_depthwise_BN/ReadVariableOp:sequential_1/model1/block_13_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
t
/sequential_1/model1/block_13_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
1sequential_1/model1/block_13_depthwise_relu/Relu6Relu6:sequential_1/model1/block_13_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_13_project/Conv2D/ReadVariableOpReadVariableOpblock_13_project/kernel*
dtype0*'
_output_shapes
:?8
?
+sequential_1/model1/block_13_project/Conv2DConv2D1sequential_1/model1/block_13_depthwise_relu/Relu6:sequential_1/model1/block_13_project/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*/
_output_shapes
:?????????8
?
6sequential_1/model1/block_13_project_BN/ReadVariableOpReadVariableOpblock_13_project_BN/gamma*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_13_project_BN/ReadVariableOp_1ReadVariableOpblock_13_project_BN/beta*
dtype0*
_output_shapes
:8
?
Gsequential_1/model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_13_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
Isequential_1/model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_13_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_13_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_13_project/Conv2D6sequential_1/model1/block_13_project_BN/ReadVariableOp8sequential_1/model1/block_13_project_BN/ReadVariableOp_1Gsequential_1/model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_13_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????8:8:8:8:8:*
epsilon%o?:*
T0*
U0
r
-sequential_1/model1/block_13_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
9sequential_1/model1/block_14_expand/Conv2D/ReadVariableOpReadVariableOpblock_14_expand/kernel*
dtype0*'
_output_shapes
:8?
?
*sequential_1/model1/block_14_expand/Conv2DConv2D8sequential_1/model1/block_13_project_BN/FusedBatchNormV39sequential_1/model1/block_14_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
5sequential_1/model1/block_14_expand_BN/ReadVariableOpReadVariableOpblock_14_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_14_expand_BN/ReadVariableOp_1ReadVariableOpblock_14_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_14_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_14_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_14_expand/Conv2D5sequential_1/model1/block_14_expand_BN/ReadVariableOp7sequential_1/model1/block_14_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_14_expand_BN/FusedBatchNormV3/ReadVariableOp_1*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( *
epsilon%o?:*
T0*
U0
q
,sequential_1/model1/block_14_expand_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
.sequential_1/model1/block_14_expand_relu/Relu6Relu67sequential_1/model1/block_14_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_14_depthwise/depthwise/ReadVariableOpReadVariableOp#block_14_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_14_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_14_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_14_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_14_expand_relu/Relu6?sequential_1/model1/block_14_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
8sequential_1/model1/block_14_depthwise_BN/ReadVariableOpReadVariableOpblock_14_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_14_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_14_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_14_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_14_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_14_depthwise/depthwise8sequential_1/model1/block_14_depthwise_BN/ReadVariableOp:sequential_1/model1/block_14_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( 
t
/sequential_1/model1/block_14_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
1sequential_1/model1/block_14_depthwise_relu/Relu6Relu6:sequential_1/model1/block_14_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_14_project/Conv2D/ReadVariableOpReadVariableOpblock_14_project/kernel*
dtype0*'
_output_shapes
:?8
?
+sequential_1/model1/block_14_project/Conv2DConv2D1sequential_1/model1/block_14_depthwise_relu/Relu6:sequential_1/model1/block_14_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????8*
paddingSAME*
T0
?
6sequential_1/model1/block_14_project_BN/ReadVariableOpReadVariableOpblock_14_project_BN/gamma*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_14_project_BN/ReadVariableOp_1ReadVariableOpblock_14_project_BN/beta*
dtype0*
_output_shapes
:8
?
Gsequential_1/model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_14_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
Isequential_1/model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_14_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_14_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_14_project/Conv2D6sequential_1/model1/block_14_project_BN/ReadVariableOp8sequential_1/model1/block_14_project_BN/ReadVariableOp_1Gsequential_1/model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_14_project_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*K
_output_shapes9
7:?????????8:8:8:8:8:*
is_training( *
epsilon%o?:
r
-sequential_1/model1/block_14_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
$sequential_1/model1/block_14_add/addAddV28sequential_1/model1/block_13_project_BN/FusedBatchNormV38sequential_1/model1/block_14_project_BN/FusedBatchNormV3*
T0*/
_output_shapes
:?????????8
?
9sequential_1/model1/block_15_expand/Conv2D/ReadVariableOpReadVariableOpblock_15_expand/kernel*
dtype0*'
_output_shapes
:8?
?
*sequential_1/model1/block_15_expand/Conv2DConv2D$sequential_1/model1/block_14_add/add9sequential_1/model1/block_15_expand/Conv2D/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
5sequential_1/model1/block_15_expand_BN/ReadVariableOpReadVariableOpblock_15_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_15_expand_BN/ReadVariableOp_1ReadVariableOpblock_15_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_15_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_15_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_15_expand/Conv2D5sequential_1/model1/block_15_expand_BN/ReadVariableOp7sequential_1/model1/block_15_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_15_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
q
,sequential_1/model1/block_15_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
.sequential_1/model1/block_15_expand_relu/Relu6Relu67sequential_1/model1/block_15_expand_BN/FusedBatchNormV3*0
_output_shapes
:??????????*
T0
?
?sequential_1/model1/block_15_depthwise/depthwise/ReadVariableOpReadVariableOp#block_15_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_15_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_15_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_15_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_15_expand_relu/Relu6?sequential_1/model1/block_15_depthwise/depthwise/ReadVariableOp*
strides
*0
_output_shapes
:??????????*
paddingSAME*
T0
?
8sequential_1/model1/block_15_depthwise_BN/ReadVariableOpReadVariableOpblock_15_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_15_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_15_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_15_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_15_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_15_depthwise/depthwise8sequential_1/model1/block_15_depthwise_BN/ReadVariableOp:sequential_1/model1/block_15_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
t
/sequential_1/model1/block_15_depthwise_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
1sequential_1/model1/block_15_depthwise_relu/Relu6Relu6:sequential_1/model1/block_15_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_15_project/Conv2D/ReadVariableOpReadVariableOpblock_15_project/kernel*
dtype0*'
_output_shapes
:?8
?
+sequential_1/model1/block_15_project/Conv2DConv2D1sequential_1/model1/block_15_depthwise_relu/Relu6:sequential_1/model1/block_15_project/Conv2D/ReadVariableOp*
T0*
strides
*/
_output_shapes
:?????????8*
paddingSAME
?
6sequential_1/model1/block_15_project_BN/ReadVariableOpReadVariableOpblock_15_project_BN/gamma*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_15_project_BN/ReadVariableOp_1ReadVariableOpblock_15_project_BN/beta*
dtype0*
_output_shapes
:8
?
Gsequential_1/model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_15_project_BN/moving_mean*
dtype0*
_output_shapes
:8
?
Isequential_1/model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_15_project_BN/moving_variance*
dtype0*
_output_shapes
:8
?
8sequential_1/model1/block_15_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_15_project/Conv2D6sequential_1/model1/block_15_project_BN/ReadVariableOp8sequential_1/model1/block_15_project_BN/ReadVariableOp_1Gsequential_1/model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_15_project_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *K
_output_shapes9
7:?????????8:8:8:8:8:
r
-sequential_1/model1/block_15_project_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
$sequential_1/model1/block_15_add/addAddV2$sequential_1/model1/block_14_add/add8sequential_1/model1/block_15_project_BN/FusedBatchNormV3*/
_output_shapes
:?????????8*
T0
?
9sequential_1/model1/block_16_expand/Conv2D/ReadVariableOpReadVariableOpblock_16_expand/kernel*
dtype0*'
_output_shapes
:8?
?
*sequential_1/model1/block_16_expand/Conv2DConv2D$sequential_1/model1/block_15_add/add9sequential_1/model1/block_16_expand/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????*
paddingSAME
?
5sequential_1/model1/block_16_expand_BN/ReadVariableOpReadVariableOpblock_16_expand_BN/gamma*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_16_expand_BN/ReadVariableOp_1ReadVariableOpblock_16_expand_BN/beta*
dtype0*
_output_shapes	
:?
?
Fsequential_1/model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_expand_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Hsequential_1/model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp"block_16_expand_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
7sequential_1/model1/block_16_expand_BN/FusedBatchNormV3FusedBatchNormV3*sequential_1/model1/block_16_expand/Conv2D5sequential_1/model1/block_16_expand_BN/ReadVariableOp7sequential_1/model1/block_16_expand_BN/ReadVariableOp_1Fsequential_1/model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOpHsequential_1/model1/block_16_expand_BN/FusedBatchNormV3/ReadVariableOp_1*
epsilon%o?:*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:
q
,sequential_1/model1/block_16_expand_BN/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w??
?
.sequential_1/model1/block_16_expand_relu/Relu6Relu67sequential_1/model1/block_16_expand_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
?sequential_1/model1/block_16_depthwise/depthwise/ReadVariableOpReadVariableOp#block_16_depthwise/depthwise_kernel*
dtype0*'
_output_shapes
:?
?
6sequential_1/model1/block_16_depthwise/depthwise/ShapeConst*%
valueB"      P     *
dtype0*
_output_shapes
:
?
>sequential_1/model1/block_16_depthwise/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
0sequential_1/model1/block_16_depthwise/depthwiseDepthwiseConv2dNative.sequential_1/model1/block_16_expand_relu/Relu6?sequential_1/model1/block_16_depthwise/depthwise/ReadVariableOp*
paddingSAME*
T0*
strides
*0
_output_shapes
:??????????
?
8sequential_1/model1/block_16_depthwise_BN/ReadVariableOpReadVariableOpblock_16_depthwise_BN/gamma*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_16_depthwise_BN/ReadVariableOp_1ReadVariableOpblock_16_depthwise_BN/beta*
dtype0*
_output_shapes	
:?
?
Isequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOpReadVariableOp!block_16_depthwise_BN/moving_mean*
dtype0*
_output_shapes	
:?
?
Ksequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp%block_16_depthwise_BN/moving_variance*
dtype0*
_output_shapes	
:?
?
:sequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3FusedBatchNormV30sequential_1/model1/block_16_depthwise/depthwise8sequential_1/model1/block_16_depthwise_BN/ReadVariableOp:sequential_1/model1/block_16_depthwise_BN/ReadVariableOp_1Isequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOpKsequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3/ReadVariableOp_1*
T0*
U0*
is_training( *P
_output_shapes>
<:??????????:?:?:?:?:*
epsilon%o?:
t
/sequential_1/model1/block_16_depthwise_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
1sequential_1/model1/block_16_depthwise_relu/Relu6Relu6:sequential_1/model1/block_16_depthwise_BN/FusedBatchNormV3*
T0*0
_output_shapes
:??????????
?
:sequential_1/model1/block_16_project/Conv2D/ReadVariableOpReadVariableOpblock_16_project/kernel*
dtype0*'
_output_shapes
:?p
?
+sequential_1/model1/block_16_project/Conv2DConv2D1sequential_1/model1/block_16_depthwise_relu/Relu6:sequential_1/model1/block_16_project/Conv2D/ReadVariableOp*
strides
*/
_output_shapes
:?????????p*
paddingSAME*
T0
?
6sequential_1/model1/block_16_project_BN/ReadVariableOpReadVariableOpblock_16_project_BN/gamma*
dtype0*
_output_shapes
:p
?
8sequential_1/model1/block_16_project_BN/ReadVariableOp_1ReadVariableOpblock_16_project_BN/beta*
dtype0*
_output_shapes
:p
?
Gsequential_1/model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOpReadVariableOpblock_16_project_BN/moving_mean*
dtype0*
_output_shapes
:p
?
Isequential_1/model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp#block_16_project_BN/moving_variance*
dtype0*
_output_shapes
:p
?
8sequential_1/model1/block_16_project_BN/FusedBatchNormV3FusedBatchNormV3+sequential_1/model1/block_16_project/Conv2D6sequential_1/model1/block_16_project_BN/ReadVariableOp8sequential_1/model1/block_16_project_BN/ReadVariableOp_1Gsequential_1/model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOpIsequential_1/model1/block_16_project_BN/FusedBatchNormV3/ReadVariableOp_1*
is_training( *K
_output_shapes9
7:?????????p:p:p:p:p:*
epsilon%o?:*
T0*
U0
r
-sequential_1/model1/block_16_project_BN/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
0sequential_1/model1/Conv_1/Conv2D/ReadVariableOpReadVariableOpConv_1/kernel*
dtype0*'
_output_shapes
:p?

?
!sequential_1/model1/Conv_1/Conv2DConv2D8sequential_1/model1/block_16_project_BN/FusedBatchNormV30sequential_1/model1/Conv_1/Conv2D/ReadVariableOp*
T0*
strides
*0
_output_shapes
:??????????
*
paddingVALID
y
,sequential_1/model1/Conv_1_bn/ReadVariableOpReadVariableOpConv_1_bn/gamma*
dtype0*
_output_shapes	
:?

z
.sequential_1/model1/Conv_1_bn/ReadVariableOp_1ReadVariableOpConv_1_bn/beta*
dtype0*
_output_shapes	
:?

?
=sequential_1/model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOpReadVariableOpConv_1_bn/moving_mean*
dtype0*
_output_shapes	
:?

?
?sequential_1/model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpConv_1_bn/moving_variance*
dtype0*
_output_shapes	
:?

?
.sequential_1/model1/Conv_1_bn/FusedBatchNormV3FusedBatchNormV3!sequential_1/model1/Conv_1/Conv2D,sequential_1/model1/Conv_1_bn/ReadVariableOp.sequential_1/model1/Conv_1_bn/ReadVariableOp_1=sequential_1/model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp?sequential_1/model1/Conv_1_bn/FusedBatchNormV3/ReadVariableOp_1*
is_training( *P
_output_shapes>
<:??????????
:?
:?
:?
:?
:*
epsilon%o?:*
T0*
U0
h
#sequential_1/model1/Conv_1_bn/ConstConst*
valueB
 *w??*
dtype0*
_output_shapes
: 
?
"sequential_1/model1/out_relu/Relu6Relu6.sequential_1/model1/Conv_1_bn/FusedBatchNormV3*0
_output_shapes
:??????????
*
T0
?
Tsequential_1/global_average_pooling2d_GlobalAveragePooling2D1/Mean/reduction_indicesConst*
valueB"      *
dtype0*
_output_shapes
:
?
Bsequential_1/global_average_pooling2d_GlobalAveragePooling2D1/MeanMean"sequential_1/model1/out_relu/Relu6Tsequential_1/global_average_pooling2d_GlobalAveragePooling2D1/Mean/reduction_indices*
T0*(
_output_shapes
:??????????

?
/sequential_3/dense_Dense1/MatMul/ReadVariableOpReadVariableOpdense_Dense1/kernel*
dtype0*
_output_shapes
:	?
d
?
 sequential_3/dense_Dense1/MatMulMatMulBsequential_1/global_average_pooling2d_GlobalAveragePooling2D1/Mean/sequential_3/dense_Dense1/MatMul/ReadVariableOp*'
_output_shapes
:?????????d*
T0
~
0sequential_3/dense_Dense1/BiasAdd/ReadVariableOpReadVariableOpdense_Dense1/bias*
dtype0*
_output_shapes
:d
?
!sequential_3/dense_Dense1/BiasAddBiasAdd sequential_3/dense_Dense1/MatMul0sequential_3/dense_Dense1/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????d
{
sequential_3/dense_Dense1/ReluRelu!sequential_3/dense_Dense1/BiasAdd*
T0*'
_output_shapes
:?????????d
?
/sequential_3/dense_Dense2/MatMul/ReadVariableOpReadVariableOpdense_Dense2/kernel*
dtype0*
_output_shapes

:d
?
 sequential_3/dense_Dense2/MatMulMatMulsequential_3/dense_Dense1/Relu/sequential_3/dense_Dense2/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
?
!sequential_3/dense_Dense2/SoftmaxSoftmax sequential_3/dense_Dense2/MatMul*
T0*'
_output_shapes
:?????????
>
predict/group_depsNoOp"^sequential_3/dense_Dense2/Softmax
Z
ConstConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB Bmodel
??
RestoreV2/tensor_namesConst"/device:CPU:0*??
value??B???B`layer_with_weights-0/layer_with_weights-0/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-100/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-101/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-102/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-103/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-18/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-20/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-22/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-26/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-28/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-30/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-32/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-34/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-36/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-38/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-40/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-42/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-44/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-46/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-48/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-50/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-52/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-54/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-56/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-58/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-60/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-62/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-64/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-66/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-68/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-70/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-72/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-74/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-76/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-78/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-8/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-80/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-82/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-84/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-86/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-88/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-90/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-92/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-94/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-96/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-98/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBIlayer_with_weights-1/layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
dtype0*
_output_shapes	
:?
?
RestoreV2/shape_and_slicesConst"/device:CPU:0*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes	
:?
?
	RestoreV2	RestoreV2ConstRestoreV2/tensor_namesRestoreV2/shape_and_slices"/device:CPU:0*?
dtypes?
?2?*?
_output_shapes?
?:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
B
IdentityIdentity	RestoreV2*
T0*
_output_shapes
:
I
AssignVariableOpAssignVariableOpConv1/kernelIdentity*
dtype0
F

Identity_1IdentityRestoreV2:1*
_output_shapes
:*
T0
N
AssignVariableOp_1AssignVariableOpbn_Conv1/beta
Identity_1*
dtype0
F

Identity_2IdentityRestoreV2:2*
_output_shapes
:*
T0
O
AssignVariableOp_2AssignVariableOpbn_Conv1/gamma
Identity_2*
dtype0
F

Identity_3IdentityRestoreV2:3*
_output_shapes
:*
T0
U
AssignVariableOp_3AssignVariableOpbn_Conv1/moving_mean
Identity_3*
dtype0
F

Identity_4IdentityRestoreV2:4*
T0*
_output_shapes
:
Y
AssignVariableOp_4AssignVariableOpbn_Conv1/moving_variance
Identity_4*
dtype0
F

Identity_5IdentityRestoreV2:5*
T0*
_output_shapes
:
W
AssignVariableOp_5AssignVariableOpblock_1_project/kernel
Identity_5*
dtype0
F

Identity_6IdentityRestoreV2:6*
T0*
_output_shapes
:
X
AssignVariableOp_6AssignVariableOpblock_16_project/kernel
Identity_6*
dtype0
F

Identity_7IdentityRestoreV2:7*
T0*
_output_shapes
:
Y
AssignVariableOp_7AssignVariableOpblock_16_project_BN/beta
Identity_7*
dtype0
F

Identity_8IdentityRestoreV2:8*
T0*
_output_shapes
:
Z
AssignVariableOp_8AssignVariableOpblock_16_project_BN/gamma
Identity_8*
dtype0
F

Identity_9IdentityRestoreV2:9*
T0*
_output_shapes
:
`
AssignVariableOp_9AssignVariableOpblock_16_project_BN/moving_mean
Identity_9*
dtype0
H
Identity_10IdentityRestoreV2:10*
T0*
_output_shapes
:
f
AssignVariableOp_10AssignVariableOp#block_16_project_BN/moving_varianceIdentity_10*
dtype0
H
Identity_11IdentityRestoreV2:11*
T0*
_output_shapes
:
P
AssignVariableOp_11AssignVariableOpConv_1/kernelIdentity_11*
dtype0
H
Identity_12IdentityRestoreV2:12*
T0*
_output_shapes
:
Q
AssignVariableOp_12AssignVariableOpConv_1_bn/betaIdentity_12*
dtype0
H
Identity_13IdentityRestoreV2:13*
T0*
_output_shapes
:
R
AssignVariableOp_13AssignVariableOpConv_1_bn/gammaIdentity_13*
dtype0
H
Identity_14IdentityRestoreV2:14*
T0*
_output_shapes
:
X
AssignVariableOp_14AssignVariableOpConv_1_bn/moving_meanIdentity_14*
dtype0
H
Identity_15IdentityRestoreV2:15*
T0*
_output_shapes
:
\
AssignVariableOp_15AssignVariableOpConv_1_bn/moving_varianceIdentity_15*
dtype0
H
Identity_16IdentityRestoreV2:16*
T0*
_output_shapes
:
Z
AssignVariableOp_16AssignVariableOpblock_1_project_BN/betaIdentity_16*
dtype0
H
Identity_17IdentityRestoreV2:17*
_output_shapes
:*
T0
[
AssignVariableOp_17AssignVariableOpblock_1_project_BN/gammaIdentity_17*
dtype0
H
Identity_18IdentityRestoreV2:18*
_output_shapes
:*
T0
a
AssignVariableOp_18AssignVariableOpblock_1_project_BN/moving_meanIdentity_18*
dtype0
H
Identity_19IdentityRestoreV2:19*
T0*
_output_shapes
:
e
AssignVariableOp_19AssignVariableOp"block_1_project_BN/moving_varianceIdentity_19*
dtype0
H
Identity_20IdentityRestoreV2:20*
T0*
_output_shapes
:
X
AssignVariableOp_20AssignVariableOpblock_2_expand/kernelIdentity_20*
dtype0
H
Identity_21IdentityRestoreV2:21*
T0*
_output_shapes
:
Y
AssignVariableOp_21AssignVariableOpblock_2_expand_BN/betaIdentity_21*
dtype0
H
Identity_22IdentityRestoreV2:22*
T0*
_output_shapes
:
Z
AssignVariableOp_22AssignVariableOpblock_2_expand_BN/gammaIdentity_22*
dtype0
H
Identity_23IdentityRestoreV2:23*
_output_shapes
:*
T0
`
AssignVariableOp_23AssignVariableOpblock_2_expand_BN/moving_meanIdentity_23*
dtype0
H
Identity_24IdentityRestoreV2:24*
T0*
_output_shapes
:
d
AssignVariableOp_24AssignVariableOp!block_2_expand_BN/moving_varianceIdentity_24*
dtype0
H
Identity_25IdentityRestoreV2:25*
T0*
_output_shapes
:
e
AssignVariableOp_25AssignVariableOp"block_2_depthwise/depthwise_kernelIdentity_25*
dtype0
H
Identity_26IdentityRestoreV2:26*
T0*
_output_shapes
:
\
AssignVariableOp_26AssignVariableOpblock_2_depthwise_BN/betaIdentity_26*
dtype0
H
Identity_27IdentityRestoreV2:27*
T0*
_output_shapes
:
]
AssignVariableOp_27AssignVariableOpblock_2_depthwise_BN/gammaIdentity_27*
dtype0
H
Identity_28IdentityRestoreV2:28*
T0*
_output_shapes
:
c
AssignVariableOp_28AssignVariableOp block_2_depthwise_BN/moving_meanIdentity_28*
dtype0
H
Identity_29IdentityRestoreV2:29*
T0*
_output_shapes
:
g
AssignVariableOp_29AssignVariableOp$block_2_depthwise_BN/moving_varianceIdentity_29*
dtype0
H
Identity_30IdentityRestoreV2:30*
_output_shapes
:*
T0
Y
AssignVariableOp_30AssignVariableOpblock_2_project/kernelIdentity_30*
dtype0
H
Identity_31IdentityRestoreV2:31*
T0*
_output_shapes
:
Z
AssignVariableOp_31AssignVariableOpblock_2_project_BN/betaIdentity_31*
dtype0
H
Identity_32IdentityRestoreV2:32*
T0*
_output_shapes
:
[
AssignVariableOp_32AssignVariableOpblock_2_project_BN/gammaIdentity_32*
dtype0
H
Identity_33IdentityRestoreV2:33*
_output_shapes
:*
T0
a
AssignVariableOp_33AssignVariableOpblock_2_project_BN/moving_meanIdentity_33*
dtype0
H
Identity_34IdentityRestoreV2:34*
T0*
_output_shapes
:
e
AssignVariableOp_34AssignVariableOp"block_2_project_BN/moving_varianceIdentity_34*
dtype0
H
Identity_35IdentityRestoreV2:35*
T0*
_output_shapes
:
X
AssignVariableOp_35AssignVariableOpblock_3_expand/kernelIdentity_35*
dtype0
H
Identity_36IdentityRestoreV2:36*
T0*
_output_shapes
:
Y
AssignVariableOp_36AssignVariableOpblock_3_expand_BN/betaIdentity_36*
dtype0
H
Identity_37IdentityRestoreV2:37*
_output_shapes
:*
T0
Z
AssignVariableOp_37AssignVariableOpblock_3_expand_BN/gammaIdentity_37*
dtype0
H
Identity_38IdentityRestoreV2:38*
T0*
_output_shapes
:
`
AssignVariableOp_38AssignVariableOpblock_3_expand_BN/moving_meanIdentity_38*
dtype0
H
Identity_39IdentityRestoreV2:39*
T0*
_output_shapes
:
d
AssignVariableOp_39AssignVariableOp!block_3_expand_BN/moving_varianceIdentity_39*
dtype0
H
Identity_40IdentityRestoreV2:40*
_output_shapes
:*
T0
k
AssignVariableOp_40AssignVariableOp(expanded_conv_depthwise/depthwise_kernelIdentity_40*
dtype0
H
Identity_41IdentityRestoreV2:41*
_output_shapes
:*
T0
e
AssignVariableOp_41AssignVariableOp"block_3_depthwise/depthwise_kernelIdentity_41*
dtype0
H
Identity_42IdentityRestoreV2:42*
T0*
_output_shapes
:
\
AssignVariableOp_42AssignVariableOpblock_3_depthwise_BN/betaIdentity_42*
dtype0
H
Identity_43IdentityRestoreV2:43*
T0*
_output_shapes
:
]
AssignVariableOp_43AssignVariableOpblock_3_depthwise_BN/gammaIdentity_43*
dtype0
H
Identity_44IdentityRestoreV2:44*
T0*
_output_shapes
:
c
AssignVariableOp_44AssignVariableOp block_3_depthwise_BN/moving_meanIdentity_44*
dtype0
H
Identity_45IdentityRestoreV2:45*
T0*
_output_shapes
:
g
AssignVariableOp_45AssignVariableOp$block_3_depthwise_BN/moving_varianceIdentity_45*
dtype0
H
Identity_46IdentityRestoreV2:46*
T0*
_output_shapes
:
Y
AssignVariableOp_46AssignVariableOpblock_3_project/kernelIdentity_46*
dtype0
H
Identity_47IdentityRestoreV2:47*
T0*
_output_shapes
:
Z
AssignVariableOp_47AssignVariableOpblock_3_project_BN/betaIdentity_47*
dtype0
H
Identity_48IdentityRestoreV2:48*
T0*
_output_shapes
:
[
AssignVariableOp_48AssignVariableOpblock_3_project_BN/gammaIdentity_48*
dtype0
H
Identity_49IdentityRestoreV2:49*
_output_shapes
:*
T0
a
AssignVariableOp_49AssignVariableOpblock_3_project_BN/moving_meanIdentity_49*
dtype0
H
Identity_50IdentityRestoreV2:50*
T0*
_output_shapes
:
e
AssignVariableOp_50AssignVariableOp"block_3_project_BN/moving_varianceIdentity_50*
dtype0
H
Identity_51IdentityRestoreV2:51*
_output_shapes
:*
T0
X
AssignVariableOp_51AssignVariableOpblock_4_expand/kernelIdentity_51*
dtype0
H
Identity_52IdentityRestoreV2:52*
T0*
_output_shapes
:
Y
AssignVariableOp_52AssignVariableOpblock_4_expand_BN/betaIdentity_52*
dtype0
H
Identity_53IdentityRestoreV2:53*
T0*
_output_shapes
:
Z
AssignVariableOp_53AssignVariableOpblock_4_expand_BN/gammaIdentity_53*
dtype0
H
Identity_54IdentityRestoreV2:54*
_output_shapes
:*
T0
`
AssignVariableOp_54AssignVariableOpblock_4_expand_BN/moving_meanIdentity_54*
dtype0
H
Identity_55IdentityRestoreV2:55*
T0*
_output_shapes
:
d
AssignVariableOp_55AssignVariableOp!block_4_expand_BN/moving_varianceIdentity_55*
dtype0
H
Identity_56IdentityRestoreV2:56*
T0*
_output_shapes
:
e
AssignVariableOp_56AssignVariableOp"block_4_depthwise/depthwise_kernelIdentity_56*
dtype0
H
Identity_57IdentityRestoreV2:57*
T0*
_output_shapes
:
\
AssignVariableOp_57AssignVariableOpblock_4_depthwise_BN/betaIdentity_57*
dtype0
H
Identity_58IdentityRestoreV2:58*
T0*
_output_shapes
:
]
AssignVariableOp_58AssignVariableOpblock_4_depthwise_BN/gammaIdentity_58*
dtype0
H
Identity_59IdentityRestoreV2:59*
T0*
_output_shapes
:
c
AssignVariableOp_59AssignVariableOp block_4_depthwise_BN/moving_meanIdentity_59*
dtype0
H
Identity_60IdentityRestoreV2:60*
T0*
_output_shapes
:
g
AssignVariableOp_60AssignVariableOp$block_4_depthwise_BN/moving_varianceIdentity_60*
dtype0
H
Identity_61IdentityRestoreV2:61*
T0*
_output_shapes
:
Y
AssignVariableOp_61AssignVariableOpblock_4_project/kernelIdentity_61*
dtype0
H
Identity_62IdentityRestoreV2:62*
T0*
_output_shapes
:
Z
AssignVariableOp_62AssignVariableOpblock_4_project_BN/betaIdentity_62*
dtype0
H
Identity_63IdentityRestoreV2:63*
T0*
_output_shapes
:
[
AssignVariableOp_63AssignVariableOpblock_4_project_BN/gammaIdentity_63*
dtype0
H
Identity_64IdentityRestoreV2:64*
T0*
_output_shapes
:
a
AssignVariableOp_64AssignVariableOpblock_4_project_BN/moving_meanIdentity_64*
dtype0
H
Identity_65IdentityRestoreV2:65*
T0*
_output_shapes
:
e
AssignVariableOp_65AssignVariableOp"block_4_project_BN/moving_varianceIdentity_65*
dtype0
H
Identity_66IdentityRestoreV2:66*
T0*
_output_shapes
:
b
AssignVariableOp_66AssignVariableOpexpanded_conv_depthwise_BN/betaIdentity_66*
dtype0
H
Identity_67IdentityRestoreV2:67*
T0*
_output_shapes
:
c
AssignVariableOp_67AssignVariableOp expanded_conv_depthwise_BN/gammaIdentity_67*
dtype0
H
Identity_68IdentityRestoreV2:68*
_output_shapes
:*
T0
i
AssignVariableOp_68AssignVariableOp&expanded_conv_depthwise_BN/moving_meanIdentity_68*
dtype0
H
Identity_69IdentityRestoreV2:69*
T0*
_output_shapes
:
m
AssignVariableOp_69AssignVariableOp*expanded_conv_depthwise_BN/moving_varianceIdentity_69*
dtype0
H
Identity_70IdentityRestoreV2:70*
T0*
_output_shapes
:
X
AssignVariableOp_70AssignVariableOpblock_5_expand/kernelIdentity_70*
dtype0
H
Identity_71IdentityRestoreV2:71*
T0*
_output_shapes
:
Y
AssignVariableOp_71AssignVariableOpblock_5_expand_BN/betaIdentity_71*
dtype0
H
Identity_72IdentityRestoreV2:72*
T0*
_output_shapes
:
Z
AssignVariableOp_72AssignVariableOpblock_5_expand_BN/gammaIdentity_72*
dtype0
H
Identity_73IdentityRestoreV2:73*
T0*
_output_shapes
:
`
AssignVariableOp_73AssignVariableOpblock_5_expand_BN/moving_meanIdentity_73*
dtype0
H
Identity_74IdentityRestoreV2:74*
T0*
_output_shapes
:
d
AssignVariableOp_74AssignVariableOp!block_5_expand_BN/moving_varianceIdentity_74*
dtype0
H
Identity_75IdentityRestoreV2:75*
_output_shapes
:*
T0
e
AssignVariableOp_75AssignVariableOp"block_5_depthwise/depthwise_kernelIdentity_75*
dtype0
H
Identity_76IdentityRestoreV2:76*
T0*
_output_shapes
:
\
AssignVariableOp_76AssignVariableOpblock_5_depthwise_BN/betaIdentity_76*
dtype0
H
Identity_77IdentityRestoreV2:77*
_output_shapes
:*
T0
]
AssignVariableOp_77AssignVariableOpblock_5_depthwise_BN/gammaIdentity_77*
dtype0
H
Identity_78IdentityRestoreV2:78*
T0*
_output_shapes
:
c
AssignVariableOp_78AssignVariableOp block_5_depthwise_BN/moving_meanIdentity_78*
dtype0
H
Identity_79IdentityRestoreV2:79*
T0*
_output_shapes
:
g
AssignVariableOp_79AssignVariableOp$block_5_depthwise_BN/moving_varianceIdentity_79*
dtype0
H
Identity_80IdentityRestoreV2:80*
T0*
_output_shapes
:
Y
AssignVariableOp_80AssignVariableOpblock_5_project/kernelIdentity_80*
dtype0
H
Identity_81IdentityRestoreV2:81*
T0*
_output_shapes
:
Z
AssignVariableOp_81AssignVariableOpblock_5_project_BN/betaIdentity_81*
dtype0
H
Identity_82IdentityRestoreV2:82*
_output_shapes
:*
T0
[
AssignVariableOp_82AssignVariableOpblock_5_project_BN/gammaIdentity_82*
dtype0
H
Identity_83IdentityRestoreV2:83*
T0*
_output_shapes
:
a
AssignVariableOp_83AssignVariableOpblock_5_project_BN/moving_meanIdentity_83*
dtype0
H
Identity_84IdentityRestoreV2:84*
T0*
_output_shapes
:
e
AssignVariableOp_84AssignVariableOp"block_5_project_BN/moving_varianceIdentity_84*
dtype0
H
Identity_85IdentityRestoreV2:85*
T0*
_output_shapes
:
X
AssignVariableOp_85AssignVariableOpblock_6_expand/kernelIdentity_85*
dtype0
H
Identity_86IdentityRestoreV2:86*
T0*
_output_shapes
:
Y
AssignVariableOp_86AssignVariableOpblock_6_expand_BN/betaIdentity_86*
dtype0
H
Identity_87IdentityRestoreV2:87*
T0*
_output_shapes
:
Z
AssignVariableOp_87AssignVariableOpblock_6_expand_BN/gammaIdentity_87*
dtype0
H
Identity_88IdentityRestoreV2:88*
_output_shapes
:*
T0
`
AssignVariableOp_88AssignVariableOpblock_6_expand_BN/moving_meanIdentity_88*
dtype0
H
Identity_89IdentityRestoreV2:89*
_output_shapes
:*
T0
d
AssignVariableOp_89AssignVariableOp!block_6_expand_BN/moving_varianceIdentity_89*
dtype0
H
Identity_90IdentityRestoreV2:90*
T0*
_output_shapes
:
e
AssignVariableOp_90AssignVariableOp"block_6_depthwise/depthwise_kernelIdentity_90*
dtype0
H
Identity_91IdentityRestoreV2:91*
T0*
_output_shapes
:
\
AssignVariableOp_91AssignVariableOpblock_6_depthwise_BN/betaIdentity_91*
dtype0
H
Identity_92IdentityRestoreV2:92*
T0*
_output_shapes
:
]
AssignVariableOp_92AssignVariableOpblock_6_depthwise_BN/gammaIdentity_92*
dtype0
H
Identity_93IdentityRestoreV2:93*
_output_shapes
:*
T0
c
AssignVariableOp_93AssignVariableOp block_6_depthwise_BN/moving_meanIdentity_93*
dtype0
H
Identity_94IdentityRestoreV2:94*
_output_shapes
:*
T0
g
AssignVariableOp_94AssignVariableOp$block_6_depthwise_BN/moving_varianceIdentity_94*
dtype0
H
Identity_95IdentityRestoreV2:95*
T0*
_output_shapes
:
_
AssignVariableOp_95AssignVariableOpexpanded_conv_project/kernelIdentity_95*
dtype0
H
Identity_96IdentityRestoreV2:96*
_output_shapes
:*
T0
Y
AssignVariableOp_96AssignVariableOpblock_6_project/kernelIdentity_96*
dtype0
H
Identity_97IdentityRestoreV2:97*
T0*
_output_shapes
:
Z
AssignVariableOp_97AssignVariableOpblock_6_project_BN/betaIdentity_97*
dtype0
H
Identity_98IdentityRestoreV2:98*
T0*
_output_shapes
:
[
AssignVariableOp_98AssignVariableOpblock_6_project_BN/gammaIdentity_98*
dtype0
H
Identity_99IdentityRestoreV2:99*
T0*
_output_shapes
:
a
AssignVariableOp_99AssignVariableOpblock_6_project_BN/moving_meanIdentity_99*
dtype0
J
Identity_100IdentityRestoreV2:100*
T0*
_output_shapes
:
g
AssignVariableOp_100AssignVariableOp"block_6_project_BN/moving_varianceIdentity_100*
dtype0
J
Identity_101IdentityRestoreV2:101*
T0*
_output_shapes
:
Z
AssignVariableOp_101AssignVariableOpblock_7_expand/kernelIdentity_101*
dtype0
J
Identity_102IdentityRestoreV2:102*
T0*
_output_shapes
:
[
AssignVariableOp_102AssignVariableOpblock_7_expand_BN/betaIdentity_102*
dtype0
J
Identity_103IdentityRestoreV2:103*
T0*
_output_shapes
:
\
AssignVariableOp_103AssignVariableOpblock_7_expand_BN/gammaIdentity_103*
dtype0
J
Identity_104IdentityRestoreV2:104*
T0*
_output_shapes
:
b
AssignVariableOp_104AssignVariableOpblock_7_expand_BN/moving_meanIdentity_104*
dtype0
J
Identity_105IdentityRestoreV2:105*
T0*
_output_shapes
:
f
AssignVariableOp_105AssignVariableOp!block_7_expand_BN/moving_varianceIdentity_105*
dtype0
J
Identity_106IdentityRestoreV2:106*
T0*
_output_shapes
:
g
AssignVariableOp_106AssignVariableOp"block_7_depthwise/depthwise_kernelIdentity_106*
dtype0
J
Identity_107IdentityRestoreV2:107*
_output_shapes
:*
T0
^
AssignVariableOp_107AssignVariableOpblock_7_depthwise_BN/betaIdentity_107*
dtype0
J
Identity_108IdentityRestoreV2:108*
T0*
_output_shapes
:
_
AssignVariableOp_108AssignVariableOpblock_7_depthwise_BN/gammaIdentity_108*
dtype0
J
Identity_109IdentityRestoreV2:109*
T0*
_output_shapes
:
e
AssignVariableOp_109AssignVariableOp block_7_depthwise_BN/moving_meanIdentity_109*
dtype0
J
Identity_110IdentityRestoreV2:110*
T0*
_output_shapes
:
i
AssignVariableOp_110AssignVariableOp$block_7_depthwise_BN/moving_varianceIdentity_110*
dtype0
J
Identity_111IdentityRestoreV2:111*
T0*
_output_shapes
:
[
AssignVariableOp_111AssignVariableOpblock_7_project/kernelIdentity_111*
dtype0
J
Identity_112IdentityRestoreV2:112*
_output_shapes
:*
T0
\
AssignVariableOp_112AssignVariableOpblock_7_project_BN/betaIdentity_112*
dtype0
J
Identity_113IdentityRestoreV2:113*
_output_shapes
:*
T0
]
AssignVariableOp_113AssignVariableOpblock_7_project_BN/gammaIdentity_113*
dtype0
J
Identity_114IdentityRestoreV2:114*
T0*
_output_shapes
:
c
AssignVariableOp_114AssignVariableOpblock_7_project_BN/moving_meanIdentity_114*
dtype0
J
Identity_115IdentityRestoreV2:115*
_output_shapes
:*
T0
g
AssignVariableOp_115AssignVariableOp"block_7_project_BN/moving_varianceIdentity_115*
dtype0
J
Identity_116IdentityRestoreV2:116*
T0*
_output_shapes
:
Z
AssignVariableOp_116AssignVariableOpblock_8_expand/kernelIdentity_116*
dtype0
J
Identity_117IdentityRestoreV2:117*
_output_shapes
:*
T0
[
AssignVariableOp_117AssignVariableOpblock_8_expand_BN/betaIdentity_117*
dtype0
J
Identity_118IdentityRestoreV2:118*
T0*
_output_shapes
:
\
AssignVariableOp_118AssignVariableOpblock_8_expand_BN/gammaIdentity_118*
dtype0
J
Identity_119IdentityRestoreV2:119*
T0*
_output_shapes
:
b
AssignVariableOp_119AssignVariableOpblock_8_expand_BN/moving_meanIdentity_119*
dtype0
J
Identity_120IdentityRestoreV2:120*
T0*
_output_shapes
:
f
AssignVariableOp_120AssignVariableOp!block_8_expand_BN/moving_varianceIdentity_120*
dtype0
J
Identity_121IdentityRestoreV2:121*
T0*
_output_shapes
:
b
AssignVariableOp_121AssignVariableOpexpanded_conv_project_BN/betaIdentity_121*
dtype0
J
Identity_122IdentityRestoreV2:122*
T0*
_output_shapes
:
c
AssignVariableOp_122AssignVariableOpexpanded_conv_project_BN/gammaIdentity_122*
dtype0
J
Identity_123IdentityRestoreV2:123*
T0*
_output_shapes
:
i
AssignVariableOp_123AssignVariableOp$expanded_conv_project_BN/moving_meanIdentity_123*
dtype0
J
Identity_124IdentityRestoreV2:124*
_output_shapes
:*
T0
m
AssignVariableOp_124AssignVariableOp(expanded_conv_project_BN/moving_varianceIdentity_124*
dtype0
J
Identity_125IdentityRestoreV2:125*
T0*
_output_shapes
:
g
AssignVariableOp_125AssignVariableOp"block_8_depthwise/depthwise_kernelIdentity_125*
dtype0
J
Identity_126IdentityRestoreV2:126*
T0*
_output_shapes
:
^
AssignVariableOp_126AssignVariableOpblock_8_depthwise_BN/betaIdentity_126*
dtype0
J
Identity_127IdentityRestoreV2:127*
T0*
_output_shapes
:
_
AssignVariableOp_127AssignVariableOpblock_8_depthwise_BN/gammaIdentity_127*
dtype0
J
Identity_128IdentityRestoreV2:128*
T0*
_output_shapes
:
e
AssignVariableOp_128AssignVariableOp block_8_depthwise_BN/moving_meanIdentity_128*
dtype0
J
Identity_129IdentityRestoreV2:129*
T0*
_output_shapes
:
i
AssignVariableOp_129AssignVariableOp$block_8_depthwise_BN/moving_varianceIdentity_129*
dtype0
J
Identity_130IdentityRestoreV2:130*
T0*
_output_shapes
:
[
AssignVariableOp_130AssignVariableOpblock_8_project/kernelIdentity_130*
dtype0
J
Identity_131IdentityRestoreV2:131*
_output_shapes
:*
T0
\
AssignVariableOp_131AssignVariableOpblock_8_project_BN/betaIdentity_131*
dtype0
J
Identity_132IdentityRestoreV2:132*
T0*
_output_shapes
:
]
AssignVariableOp_132AssignVariableOpblock_8_project_BN/gammaIdentity_132*
dtype0
J
Identity_133IdentityRestoreV2:133*
T0*
_output_shapes
:
c
AssignVariableOp_133AssignVariableOpblock_8_project_BN/moving_meanIdentity_133*
dtype0
J
Identity_134IdentityRestoreV2:134*
T0*
_output_shapes
:
g
AssignVariableOp_134AssignVariableOp"block_8_project_BN/moving_varianceIdentity_134*
dtype0
J
Identity_135IdentityRestoreV2:135*
_output_shapes
:*
T0
Z
AssignVariableOp_135AssignVariableOpblock_9_expand/kernelIdentity_135*
dtype0
J
Identity_136IdentityRestoreV2:136*
T0*
_output_shapes
:
[
AssignVariableOp_136AssignVariableOpblock_9_expand_BN/betaIdentity_136*
dtype0
J
Identity_137IdentityRestoreV2:137*
T0*
_output_shapes
:
\
AssignVariableOp_137AssignVariableOpblock_9_expand_BN/gammaIdentity_137*
dtype0
J
Identity_138IdentityRestoreV2:138*
T0*
_output_shapes
:
b
AssignVariableOp_138AssignVariableOpblock_9_expand_BN/moving_meanIdentity_138*
dtype0
J
Identity_139IdentityRestoreV2:139*
_output_shapes
:*
T0
f
AssignVariableOp_139AssignVariableOp!block_9_expand_BN/moving_varianceIdentity_139*
dtype0
J
Identity_140IdentityRestoreV2:140*
T0*
_output_shapes
:
g
AssignVariableOp_140AssignVariableOp"block_9_depthwise/depthwise_kernelIdentity_140*
dtype0
J
Identity_141IdentityRestoreV2:141*
_output_shapes
:*
T0
^
AssignVariableOp_141AssignVariableOpblock_9_depthwise_BN/betaIdentity_141*
dtype0
J
Identity_142IdentityRestoreV2:142*
T0*
_output_shapes
:
_
AssignVariableOp_142AssignVariableOpblock_9_depthwise_BN/gammaIdentity_142*
dtype0
J
Identity_143IdentityRestoreV2:143*
T0*
_output_shapes
:
e
AssignVariableOp_143AssignVariableOp block_9_depthwise_BN/moving_meanIdentity_143*
dtype0
J
Identity_144IdentityRestoreV2:144*
T0*
_output_shapes
:
i
AssignVariableOp_144AssignVariableOp$block_9_depthwise_BN/moving_varianceIdentity_144*
dtype0
J
Identity_145IdentityRestoreV2:145*
_output_shapes
:*
T0
[
AssignVariableOp_145AssignVariableOpblock_9_project/kernelIdentity_145*
dtype0
J
Identity_146IdentityRestoreV2:146*
_output_shapes
:*
T0
\
AssignVariableOp_146AssignVariableOpblock_9_project_BN/betaIdentity_146*
dtype0
J
Identity_147IdentityRestoreV2:147*
_output_shapes
:*
T0
]
AssignVariableOp_147AssignVariableOpblock_9_project_BN/gammaIdentity_147*
dtype0
J
Identity_148IdentityRestoreV2:148*
T0*
_output_shapes
:
c
AssignVariableOp_148AssignVariableOpblock_9_project_BN/moving_meanIdentity_148*
dtype0
J
Identity_149IdentityRestoreV2:149*
T0*
_output_shapes
:
g
AssignVariableOp_149AssignVariableOp"block_9_project_BN/moving_varianceIdentity_149*
dtype0
J
Identity_150IdentityRestoreV2:150*
T0*
_output_shapes
:
Z
AssignVariableOp_150AssignVariableOpblock_1_expand/kernelIdentity_150*
dtype0
J
Identity_151IdentityRestoreV2:151*
T0*
_output_shapes
:
[
AssignVariableOp_151AssignVariableOpblock_10_expand/kernelIdentity_151*
dtype0
J
Identity_152IdentityRestoreV2:152*
T0*
_output_shapes
:
\
AssignVariableOp_152AssignVariableOpblock_10_expand_BN/betaIdentity_152*
dtype0
J
Identity_153IdentityRestoreV2:153*
T0*
_output_shapes
:
]
AssignVariableOp_153AssignVariableOpblock_10_expand_BN/gammaIdentity_153*
dtype0
J
Identity_154IdentityRestoreV2:154*
T0*
_output_shapes
:
c
AssignVariableOp_154AssignVariableOpblock_10_expand_BN/moving_meanIdentity_154*
dtype0
J
Identity_155IdentityRestoreV2:155*
T0*
_output_shapes
:
g
AssignVariableOp_155AssignVariableOp"block_10_expand_BN/moving_varianceIdentity_155*
dtype0
J
Identity_156IdentityRestoreV2:156*
_output_shapes
:*
T0
h
AssignVariableOp_156AssignVariableOp#block_10_depthwise/depthwise_kernelIdentity_156*
dtype0
J
Identity_157IdentityRestoreV2:157*
_output_shapes
:*
T0
_
AssignVariableOp_157AssignVariableOpblock_10_depthwise_BN/betaIdentity_157*
dtype0
J
Identity_158IdentityRestoreV2:158*
T0*
_output_shapes
:
`
AssignVariableOp_158AssignVariableOpblock_10_depthwise_BN/gammaIdentity_158*
dtype0
J
Identity_159IdentityRestoreV2:159*
T0*
_output_shapes
:
f
AssignVariableOp_159AssignVariableOp!block_10_depthwise_BN/moving_meanIdentity_159*
dtype0
J
Identity_160IdentityRestoreV2:160*
T0*
_output_shapes
:
j
AssignVariableOp_160AssignVariableOp%block_10_depthwise_BN/moving_varianceIdentity_160*
dtype0
J
Identity_161IdentityRestoreV2:161*
T0*
_output_shapes
:
\
AssignVariableOp_161AssignVariableOpblock_10_project/kernelIdentity_161*
dtype0
J
Identity_162IdentityRestoreV2:162*
_output_shapes
:*
T0
]
AssignVariableOp_162AssignVariableOpblock_10_project_BN/betaIdentity_162*
dtype0
J
Identity_163IdentityRestoreV2:163*
_output_shapes
:*
T0
^
AssignVariableOp_163AssignVariableOpblock_10_project_BN/gammaIdentity_163*
dtype0
J
Identity_164IdentityRestoreV2:164*
T0*
_output_shapes
:
d
AssignVariableOp_164AssignVariableOpblock_10_project_BN/moving_meanIdentity_164*
dtype0
J
Identity_165IdentityRestoreV2:165*
T0*
_output_shapes
:
h
AssignVariableOp_165AssignVariableOp#block_10_project_BN/moving_varianceIdentity_165*
dtype0
J
Identity_166IdentityRestoreV2:166*
_output_shapes
:*
T0
[
AssignVariableOp_166AssignVariableOpblock_11_expand/kernelIdentity_166*
dtype0
J
Identity_167IdentityRestoreV2:167*
_output_shapes
:*
T0
\
AssignVariableOp_167AssignVariableOpblock_11_expand_BN/betaIdentity_167*
dtype0
J
Identity_168IdentityRestoreV2:168*
T0*
_output_shapes
:
]
AssignVariableOp_168AssignVariableOpblock_11_expand_BN/gammaIdentity_168*
dtype0
J
Identity_169IdentityRestoreV2:169*
T0*
_output_shapes
:
c
AssignVariableOp_169AssignVariableOpblock_11_expand_BN/moving_meanIdentity_169*
dtype0
J
Identity_170IdentityRestoreV2:170*
_output_shapes
:*
T0
g
AssignVariableOp_170AssignVariableOp"block_11_expand_BN/moving_varianceIdentity_170*
dtype0
J
Identity_171IdentityRestoreV2:171*
_output_shapes
:*
T0
h
AssignVariableOp_171AssignVariableOp#block_11_depthwise/depthwise_kernelIdentity_171*
dtype0
J
Identity_172IdentityRestoreV2:172*
_output_shapes
:*
T0
_
AssignVariableOp_172AssignVariableOpblock_11_depthwise_BN/betaIdentity_172*
dtype0
J
Identity_173IdentityRestoreV2:173*
_output_shapes
:*
T0
`
AssignVariableOp_173AssignVariableOpblock_11_depthwise_BN/gammaIdentity_173*
dtype0
J
Identity_174IdentityRestoreV2:174*
T0*
_output_shapes
:
f
AssignVariableOp_174AssignVariableOp!block_11_depthwise_BN/moving_meanIdentity_174*
dtype0
J
Identity_175IdentityRestoreV2:175*
T0*
_output_shapes
:
j
AssignVariableOp_175AssignVariableOp%block_11_depthwise_BN/moving_varianceIdentity_175*
dtype0
J
Identity_176IdentityRestoreV2:176*
_output_shapes
:*
T0
[
AssignVariableOp_176AssignVariableOpblock_1_expand_BN/betaIdentity_176*
dtype0
J
Identity_177IdentityRestoreV2:177*
_output_shapes
:*
T0
\
AssignVariableOp_177AssignVariableOpblock_1_expand_BN/gammaIdentity_177*
dtype0
J
Identity_178IdentityRestoreV2:178*
T0*
_output_shapes
:
b
AssignVariableOp_178AssignVariableOpblock_1_expand_BN/moving_meanIdentity_178*
dtype0
J
Identity_179IdentityRestoreV2:179*
T0*
_output_shapes
:
f
AssignVariableOp_179AssignVariableOp!block_1_expand_BN/moving_varianceIdentity_179*
dtype0
J
Identity_180IdentityRestoreV2:180*
_output_shapes
:*
T0
\
AssignVariableOp_180AssignVariableOpblock_11_project/kernelIdentity_180*
dtype0
J
Identity_181IdentityRestoreV2:181*
T0*
_output_shapes
:
]
AssignVariableOp_181AssignVariableOpblock_11_project_BN/betaIdentity_181*
dtype0
J
Identity_182IdentityRestoreV2:182*
T0*
_output_shapes
:
^
AssignVariableOp_182AssignVariableOpblock_11_project_BN/gammaIdentity_182*
dtype0
J
Identity_183IdentityRestoreV2:183*
T0*
_output_shapes
:
d
AssignVariableOp_183AssignVariableOpblock_11_project_BN/moving_meanIdentity_183*
dtype0
J
Identity_184IdentityRestoreV2:184*
T0*
_output_shapes
:
h
AssignVariableOp_184AssignVariableOp#block_11_project_BN/moving_varianceIdentity_184*
dtype0
J
Identity_185IdentityRestoreV2:185*
_output_shapes
:*
T0
[
AssignVariableOp_185AssignVariableOpblock_12_expand/kernelIdentity_185*
dtype0
J
Identity_186IdentityRestoreV2:186*
T0*
_output_shapes
:
\
AssignVariableOp_186AssignVariableOpblock_12_expand_BN/betaIdentity_186*
dtype0
J
Identity_187IdentityRestoreV2:187*
T0*
_output_shapes
:
]
AssignVariableOp_187AssignVariableOpblock_12_expand_BN/gammaIdentity_187*
dtype0
J
Identity_188IdentityRestoreV2:188*
T0*
_output_shapes
:
c
AssignVariableOp_188AssignVariableOpblock_12_expand_BN/moving_meanIdentity_188*
dtype0
J
Identity_189IdentityRestoreV2:189*
T0*
_output_shapes
:
g
AssignVariableOp_189AssignVariableOp"block_12_expand_BN/moving_varianceIdentity_189*
dtype0
J
Identity_190IdentityRestoreV2:190*
T0*
_output_shapes
:
h
AssignVariableOp_190AssignVariableOp#block_12_depthwise/depthwise_kernelIdentity_190*
dtype0
J
Identity_191IdentityRestoreV2:191*
T0*
_output_shapes
:
_
AssignVariableOp_191AssignVariableOpblock_12_depthwise_BN/betaIdentity_191*
dtype0
J
Identity_192IdentityRestoreV2:192*
T0*
_output_shapes
:
`
AssignVariableOp_192AssignVariableOpblock_12_depthwise_BN/gammaIdentity_192*
dtype0
J
Identity_193IdentityRestoreV2:193*
T0*
_output_shapes
:
f
AssignVariableOp_193AssignVariableOp!block_12_depthwise_BN/moving_meanIdentity_193*
dtype0
J
Identity_194IdentityRestoreV2:194*
T0*
_output_shapes
:
j
AssignVariableOp_194AssignVariableOp%block_12_depthwise_BN/moving_varianceIdentity_194*
dtype0
J
Identity_195IdentityRestoreV2:195*
T0*
_output_shapes
:
\
AssignVariableOp_195AssignVariableOpblock_12_project/kernelIdentity_195*
dtype0
J
Identity_196IdentityRestoreV2:196*
T0*
_output_shapes
:
]
AssignVariableOp_196AssignVariableOpblock_12_project_BN/betaIdentity_196*
dtype0
J
Identity_197IdentityRestoreV2:197*
T0*
_output_shapes
:
^
AssignVariableOp_197AssignVariableOpblock_12_project_BN/gammaIdentity_197*
dtype0
J
Identity_198IdentityRestoreV2:198*
T0*
_output_shapes
:
d
AssignVariableOp_198AssignVariableOpblock_12_project_BN/moving_meanIdentity_198*
dtype0
J
Identity_199IdentityRestoreV2:199*
T0*
_output_shapes
:
h
AssignVariableOp_199AssignVariableOp#block_12_project_BN/moving_varianceIdentity_199*
dtype0
J
Identity_200IdentityRestoreV2:200*
T0*
_output_shapes
:
[
AssignVariableOp_200AssignVariableOpblock_13_expand/kernelIdentity_200*
dtype0
J
Identity_201IdentityRestoreV2:201*
T0*
_output_shapes
:
\
AssignVariableOp_201AssignVariableOpblock_13_expand_BN/betaIdentity_201*
dtype0
J
Identity_202IdentityRestoreV2:202*
T0*
_output_shapes
:
]
AssignVariableOp_202AssignVariableOpblock_13_expand_BN/gammaIdentity_202*
dtype0
J
Identity_203IdentityRestoreV2:203*
_output_shapes
:*
T0
c
AssignVariableOp_203AssignVariableOpblock_13_expand_BN/moving_meanIdentity_203*
dtype0
J
Identity_204IdentityRestoreV2:204*
T0*
_output_shapes
:
g
AssignVariableOp_204AssignVariableOp"block_13_expand_BN/moving_varianceIdentity_204*
dtype0
J
Identity_205IdentityRestoreV2:205*
T0*
_output_shapes
:
g
AssignVariableOp_205AssignVariableOp"block_1_depthwise/depthwise_kernelIdentity_205*
dtype0
J
Identity_206IdentityRestoreV2:206*
T0*
_output_shapes
:
h
AssignVariableOp_206AssignVariableOp#block_13_depthwise/depthwise_kernelIdentity_206*
dtype0
J
Identity_207IdentityRestoreV2:207*
T0*
_output_shapes
:
_
AssignVariableOp_207AssignVariableOpblock_13_depthwise_BN/betaIdentity_207*
dtype0
J
Identity_208IdentityRestoreV2:208*
T0*
_output_shapes
:
`
AssignVariableOp_208AssignVariableOpblock_13_depthwise_BN/gammaIdentity_208*
dtype0
J
Identity_209IdentityRestoreV2:209*
_output_shapes
:*
T0
f
AssignVariableOp_209AssignVariableOp!block_13_depthwise_BN/moving_meanIdentity_209*
dtype0
J
Identity_210IdentityRestoreV2:210*
T0*
_output_shapes
:
j
AssignVariableOp_210AssignVariableOp%block_13_depthwise_BN/moving_varianceIdentity_210*
dtype0
J
Identity_211IdentityRestoreV2:211*
T0*
_output_shapes
:
\
AssignVariableOp_211AssignVariableOpblock_13_project/kernelIdentity_211*
dtype0
J
Identity_212IdentityRestoreV2:212*
T0*
_output_shapes
:
]
AssignVariableOp_212AssignVariableOpblock_13_project_BN/betaIdentity_212*
dtype0
J
Identity_213IdentityRestoreV2:213*
T0*
_output_shapes
:
^
AssignVariableOp_213AssignVariableOpblock_13_project_BN/gammaIdentity_213*
dtype0
J
Identity_214IdentityRestoreV2:214*
T0*
_output_shapes
:
d
AssignVariableOp_214AssignVariableOpblock_13_project_BN/moving_meanIdentity_214*
dtype0
J
Identity_215IdentityRestoreV2:215*
_output_shapes
:*
T0
h
AssignVariableOp_215AssignVariableOp#block_13_project_BN/moving_varianceIdentity_215*
dtype0
J
Identity_216IdentityRestoreV2:216*
T0*
_output_shapes
:
[
AssignVariableOp_216AssignVariableOpblock_14_expand/kernelIdentity_216*
dtype0
J
Identity_217IdentityRestoreV2:217*
T0*
_output_shapes
:
\
AssignVariableOp_217AssignVariableOpblock_14_expand_BN/betaIdentity_217*
dtype0
J
Identity_218IdentityRestoreV2:218*
T0*
_output_shapes
:
]
AssignVariableOp_218AssignVariableOpblock_14_expand_BN/gammaIdentity_218*
dtype0
J
Identity_219IdentityRestoreV2:219*
T0*
_output_shapes
:
c
AssignVariableOp_219AssignVariableOpblock_14_expand_BN/moving_meanIdentity_219*
dtype0
J
Identity_220IdentityRestoreV2:220*
T0*
_output_shapes
:
g
AssignVariableOp_220AssignVariableOp"block_14_expand_BN/moving_varianceIdentity_220*
dtype0
J
Identity_221IdentityRestoreV2:221*
_output_shapes
:*
T0
h
AssignVariableOp_221AssignVariableOp#block_14_depthwise/depthwise_kernelIdentity_221*
dtype0
J
Identity_222IdentityRestoreV2:222*
T0*
_output_shapes
:
_
AssignVariableOp_222AssignVariableOpblock_14_depthwise_BN/betaIdentity_222*
dtype0
J
Identity_223IdentityRestoreV2:223*
T0*
_output_shapes
:
`
AssignVariableOp_223AssignVariableOpblock_14_depthwise_BN/gammaIdentity_223*
dtype0
J
Identity_224IdentityRestoreV2:224*
T0*
_output_shapes
:
f
AssignVariableOp_224AssignVariableOp!block_14_depthwise_BN/moving_meanIdentity_224*
dtype0
J
Identity_225IdentityRestoreV2:225*
T0*
_output_shapes
:
j
AssignVariableOp_225AssignVariableOp%block_14_depthwise_BN/moving_varianceIdentity_225*
dtype0
J
Identity_226IdentityRestoreV2:226*
T0*
_output_shapes
:
\
AssignVariableOp_226AssignVariableOpblock_14_project/kernelIdentity_226*
dtype0
J
Identity_227IdentityRestoreV2:227*
_output_shapes
:*
T0
]
AssignVariableOp_227AssignVariableOpblock_14_project_BN/betaIdentity_227*
dtype0
J
Identity_228IdentityRestoreV2:228*
T0*
_output_shapes
:
^
AssignVariableOp_228AssignVariableOpblock_14_project_BN/gammaIdentity_228*
dtype0
J
Identity_229IdentityRestoreV2:229*
T0*
_output_shapes
:
d
AssignVariableOp_229AssignVariableOpblock_14_project_BN/moving_meanIdentity_229*
dtype0
J
Identity_230IdentityRestoreV2:230*
T0*
_output_shapes
:
h
AssignVariableOp_230AssignVariableOp#block_14_project_BN/moving_varianceIdentity_230*
dtype0
J
Identity_231IdentityRestoreV2:231*
_output_shapes
:*
T0
^
AssignVariableOp_231AssignVariableOpblock_1_depthwise_BN/betaIdentity_231*
dtype0
J
Identity_232IdentityRestoreV2:232*
T0*
_output_shapes
:
_
AssignVariableOp_232AssignVariableOpblock_1_depthwise_BN/gammaIdentity_232*
dtype0
J
Identity_233IdentityRestoreV2:233*
T0*
_output_shapes
:
e
AssignVariableOp_233AssignVariableOp block_1_depthwise_BN/moving_meanIdentity_233*
dtype0
J
Identity_234IdentityRestoreV2:234*
T0*
_output_shapes
:
i
AssignVariableOp_234AssignVariableOp$block_1_depthwise_BN/moving_varianceIdentity_234*
dtype0
J
Identity_235IdentityRestoreV2:235*
T0*
_output_shapes
:
[
AssignVariableOp_235AssignVariableOpblock_15_expand/kernelIdentity_235*
dtype0
J
Identity_236IdentityRestoreV2:236*
T0*
_output_shapes
:
\
AssignVariableOp_236AssignVariableOpblock_15_expand_BN/betaIdentity_236*
dtype0
J
Identity_237IdentityRestoreV2:237*
T0*
_output_shapes
:
]
AssignVariableOp_237AssignVariableOpblock_15_expand_BN/gammaIdentity_237*
dtype0
J
Identity_238IdentityRestoreV2:238*
T0*
_output_shapes
:
c
AssignVariableOp_238AssignVariableOpblock_15_expand_BN/moving_meanIdentity_238*
dtype0
J
Identity_239IdentityRestoreV2:239*
_output_shapes
:*
T0
g
AssignVariableOp_239AssignVariableOp"block_15_expand_BN/moving_varianceIdentity_239*
dtype0
J
Identity_240IdentityRestoreV2:240*
T0*
_output_shapes
:
h
AssignVariableOp_240AssignVariableOp#block_15_depthwise/depthwise_kernelIdentity_240*
dtype0
J
Identity_241IdentityRestoreV2:241*
T0*
_output_shapes
:
_
AssignVariableOp_241AssignVariableOpblock_15_depthwise_BN/betaIdentity_241*
dtype0
J
Identity_242IdentityRestoreV2:242*
T0*
_output_shapes
:
`
AssignVariableOp_242AssignVariableOpblock_15_depthwise_BN/gammaIdentity_242*
dtype0
J
Identity_243IdentityRestoreV2:243*
T0*
_output_shapes
:
f
AssignVariableOp_243AssignVariableOp!block_15_depthwise_BN/moving_meanIdentity_243*
dtype0
J
Identity_244IdentityRestoreV2:244*
T0*
_output_shapes
:
j
AssignVariableOp_244AssignVariableOp%block_15_depthwise_BN/moving_varianceIdentity_244*
dtype0
J
Identity_245IdentityRestoreV2:245*
_output_shapes
:*
T0
\
AssignVariableOp_245AssignVariableOpblock_15_project/kernelIdentity_245*
dtype0
J
Identity_246IdentityRestoreV2:246*
_output_shapes
:*
T0
]
AssignVariableOp_246AssignVariableOpblock_15_project_BN/betaIdentity_246*
dtype0
J
Identity_247IdentityRestoreV2:247*
T0*
_output_shapes
:
^
AssignVariableOp_247AssignVariableOpblock_15_project_BN/gammaIdentity_247*
dtype0
J
Identity_248IdentityRestoreV2:248*
T0*
_output_shapes
:
d
AssignVariableOp_248AssignVariableOpblock_15_project_BN/moving_meanIdentity_248*
dtype0
J
Identity_249IdentityRestoreV2:249*
T0*
_output_shapes
:
h
AssignVariableOp_249AssignVariableOp#block_15_project_BN/moving_varianceIdentity_249*
dtype0
J
Identity_250IdentityRestoreV2:250*
T0*
_output_shapes
:
[
AssignVariableOp_250AssignVariableOpblock_16_expand/kernelIdentity_250*
dtype0
J
Identity_251IdentityRestoreV2:251*
T0*
_output_shapes
:
\
AssignVariableOp_251AssignVariableOpblock_16_expand_BN/betaIdentity_251*
dtype0
J
Identity_252IdentityRestoreV2:252*
T0*
_output_shapes
:
]
AssignVariableOp_252AssignVariableOpblock_16_expand_BN/gammaIdentity_252*
dtype0
J
Identity_253IdentityRestoreV2:253*
T0*
_output_shapes
:
c
AssignVariableOp_253AssignVariableOpblock_16_expand_BN/moving_meanIdentity_253*
dtype0
J
Identity_254IdentityRestoreV2:254*
T0*
_output_shapes
:
g
AssignVariableOp_254AssignVariableOp"block_16_expand_BN/moving_varianceIdentity_254*
dtype0
J
Identity_255IdentityRestoreV2:255*
T0*
_output_shapes
:
h
AssignVariableOp_255AssignVariableOp#block_16_depthwise/depthwise_kernelIdentity_255*
dtype0
J
Identity_256IdentityRestoreV2:256*
T0*
_output_shapes
:
_
AssignVariableOp_256AssignVariableOpblock_16_depthwise_BN/betaIdentity_256*
dtype0
J
Identity_257IdentityRestoreV2:257*
T0*
_output_shapes
:
`
AssignVariableOp_257AssignVariableOpblock_16_depthwise_BN/gammaIdentity_257*
dtype0
J
Identity_258IdentityRestoreV2:258*
T0*
_output_shapes
:
f
AssignVariableOp_258AssignVariableOp!block_16_depthwise_BN/moving_meanIdentity_258*
dtype0
J
Identity_259IdentityRestoreV2:259*
T0*
_output_shapes
:
j
AssignVariableOp_259AssignVariableOp%block_16_depthwise_BN/moving_varianceIdentity_259*
dtype0
J
Identity_260IdentityRestoreV2:260*
T0*
_output_shapes
:
V
AssignVariableOp_260AssignVariableOpdense_Dense1/biasIdentity_260*
dtype0
J
Identity_261IdentityRestoreV2:261*
T0*
_output_shapes
:
X
AssignVariableOp_261AssignVariableOpdense_Dense1/kernelIdentity_261*
dtype0
J
Identity_262IdentityRestoreV2:262*
T0*
_output_shapes
:
X
AssignVariableOp_262AssignVariableOpdense_Dense2/kernelIdentity_262*
dtype0
W
VarIsInitializedOpVarIsInitializedOpblock_1_expand/kernel*
_output_shapes
: 
h
VarIsInitializedOp_1VarIsInitializedOp$block_3_depthwise_BN/moving_variance*
_output_shapes
: 
b
VarIsInitializedOp_2VarIsInitializedOpblock_3_project_BN/moving_mean*
_output_shapes
: 
Z
VarIsInitializedOp_3VarIsInitializedOpblock_5_expand_BN/beta*
_output_shapes
: 
g
VarIsInitializedOp_4VarIsInitializedOp#block_10_project_BN/moving_variance*
_output_shapes
: 
[
VarIsInitializedOp_5VarIsInitializedOpblock_12_expand_BN/beta*
_output_shapes
: 
Z
VarIsInitializedOp_6VarIsInitializedOpblock_15_expand/kernel*
_output_shapes
: 
c
VarIsInitializedOp_7VarIsInitializedOpblock_16_project_BN/moving_mean*
_output_shapes
: 
\
VarIsInitializedOp_8VarIsInitializedOpblock_1_project_BN/gamma*
_output_shapes
: 
f
VarIsInitializedOp_9VarIsInitializedOp"block_7_project_BN/moving_variance*
_output_shapes
: 
Z
VarIsInitializedOp_10VarIsInitializedOpblock_9_expand/kernel*
_output_shapes
: 
h
VarIsInitializedOp_11VarIsInitializedOp#block_11_depthwise/depthwise_kernel*
_output_shapes
: 
]
VarIsInitializedOp_12VarIsInitializedOpblock_12_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_13VarIsInitializedOpblock_13_expand_BN/beta*
_output_shapes
: 
`
VarIsInitializedOp_14VarIsInitializedOpblock_15_depthwise_BN/gamma*
_output_shapes
: 
c
VarIsInitializedOp_15VarIsInitializedOpexpanded_conv_project_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_16VarIsInitializedOpblock_3_expand_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_17VarIsInitializedOpblock_8_expand_BN/gamma*
_output_shapes
: 
c
VarIsInitializedOp_18VarIsInitializedOpblock_8_project_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_19VarIsInitializedOp"block_9_depthwise/depthwise_kernel*
_output_shapes
: 
j
VarIsInitializedOp_20VarIsInitializedOp%block_12_depthwise_BN/moving_variance*
_output_shapes
: 
j
VarIsInitializedOp_21VarIsInitializedOp%block_13_depthwise_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_22VarIsInitializedOpblock_13_project_BN/gamma*
_output_shapes
: 
d
VarIsInitializedOp_23VarIsInitializedOpblock_14_project_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_24VarIsInitializedOp"block_2_depthwise/depthwise_kernel*
_output_shapes
: 
Z
VarIsInitializedOp_25VarIsInitializedOpblock_5_expand/kernel*
_output_shapes
: 
\
VarIsInitializedOp_26VarIsInitializedOpblock_11_project/kernel*
_output_shapes
: 
d
VarIsInitializedOp_27VarIsInitializedOpblock_15_project_BN/moving_mean*
_output_shapes
: 
Z
VarIsInitializedOp_28VarIsInitializedOpConv_1_bn/moving_mean*
_output_shapes
: 
[
VarIsInitializedOp_29VarIsInitializedOpblock_16_expand/kernel*
_output_shapes
: 
m
VarIsInitializedOp_30VarIsInitializedOp(expanded_conv_project_BN/moving_variance*
_output_shapes
: 
[
VarIsInitializedOp_31VarIsInitializedOpblock_5_project/kernel*
_output_shapes
: 
]
VarIsInitializedOp_32VarIsInitializedOpblock_7_project_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_33VarIsInitializedOpblock_9_depthwise_BN/gamma*
_output_shapes
: 
h
VarIsInitializedOp_34VarIsInitializedOp#block_10_depthwise/depthwise_kernel*
_output_shapes
: 
f
VarIsInitializedOp_35VarIsInitializedOp!block_10_depthwise_BN/moving_mean*
_output_shapes
: 
_
VarIsInitializedOp_36VarIsInitializedOpblock_11_depthwise_BN/beta*
_output_shapes
: 
h
VarIsInitializedOp_37VarIsInitializedOp#block_13_project_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_38VarIsInitializedOp#block_16_depthwise/depthwise_kernel*
_output_shapes
: 
e
VarIsInitializedOp_39VarIsInitializedOp expanded_conv_depthwise_BN/gamma*
_output_shapes
: 
e
VarIsInitializedOp_40VarIsInitializedOp block_1_depthwise_BN/moving_mean*
_output_shapes
: 
f
VarIsInitializedOp_41VarIsInitializedOp!block_3_expand_BN/moving_variance*
_output_shapes
: 
c
VarIsInitializedOp_42VarIsInitializedOpblock_4_project_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_43VarIsInitializedOp"block_6_depthwise/depthwise_kernel*
_output_shapes
: 
_
VarIsInitializedOp_44VarIsInitializedOpblock_6_depthwise_BN/gamma*
_output_shapes
: 
c
VarIsInitializedOp_45VarIsInitializedOpblock_10_expand_BN/moving_mean*
_output_shapes
: 
`
VarIsInitializedOp_46VarIsInitializedOpblock_10_depthwise_BN/gamma*
_output_shapes
: 
c
VarIsInitializedOp_47VarIsInitializedOpblock_11_expand_BN/moving_mean*
_output_shapes
: 
d
VarIsInitializedOp_48VarIsInitializedOpblock_11_project_BN/moving_mean*
_output_shapes
: 
X
VarIsInitializedOp_49VarIsInitializedOpdense_Dense2/kernel*
_output_shapes
: 
^
VarIsInitializedOp_50VarIsInitializedOpblock_1_depthwise_BN/beta*
_output_shapes
: 
g
VarIsInitializedOp_51VarIsInitializedOp"block_2_project_BN/moving_variance*
_output_shapes
: 
_
VarIsInitializedOp_52VarIsInitializedOpblock_3_depthwise_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_53VarIsInitializedOpblock_5_depthwise_BN/gamma*
_output_shapes
: 
[
VarIsInitializedOp_54VarIsInitializedOpblock_6_expand_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_55VarIsInitializedOpblock_9_expand_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_56VarIsInitializedOpblock_10_depthwise_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_57VarIsInitializedOpblock_16_project/kernel*
_output_shapes
: 
R
VarIsInitializedOp_58VarIsInitializedOpConv_1/kernel*
_output_shapes
: 
_
VarIsInitializedOp_59VarIsInitializedOpblock_12_depthwise_BN/beta*
_output_shapes
: 
f
VarIsInitializedOp_60VarIsInitializedOp!block_1_expand_BN/moving_variance*
_output_shapes
: 
i
VarIsInitializedOp_61VarIsInitializedOp$block_2_depthwise_BN/moving_variance*
_output_shapes
: 
_
VarIsInitializedOp_62VarIsInitializedOpblock_4_depthwise_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_63VarIsInitializedOpblock_6_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_64VarIsInitializedOpblock_7_expand_BN/gamma*
_output_shapes
: 
[
VarIsInitializedOp_65VarIsInitializedOpblock_8_project/kernel*
_output_shapes
: 
\
VarIsInitializedOp_66VarIsInitializedOpblock_9_project_BN/beta*
_output_shapes
: 
^
VarIsInitializedOp_67VarIsInitializedOpblock_11_project_BN/gamma*
_output_shapes
: 
]
VarIsInitializedOp_68VarIsInitializedOpblock_12_expand_BN/gamma*
_output_shapes
: 
`
VarIsInitializedOp_69VarIsInitializedOpblock_13_depthwise_BN/gamma*
_output_shapes
: 
g
VarIsInitializedOp_70VarIsInitializedOp"block_12_expand_BN/moving_variance*
_output_shapes
: 
g
VarIsInitializedOp_71VarIsInitializedOp"block_14_expand_BN/moving_variance*
_output_shapes
: 
k
VarIsInitializedOp_72VarIsInitializedOp&expanded_conv_depthwise_BN/moving_mean*
_output_shapes
: 
[
VarIsInitializedOp_73VarIsInitializedOpblock_2_expand_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_74VarIsInitializedOpblock_5_expand_BN/gamma*
_output_shapes
: 
g
VarIsInitializedOp_75VarIsInitializedOp"block_7_depthwise/depthwise_kernel*
_output_shapes
: 
^
VarIsInitializedOp_76VarIsInitializedOpblock_12_project_BN/gamma*
_output_shapes
: 
]
VarIsInitializedOp_77VarIsInitializedOpblock_13_expand_BN/gamma*
_output_shapes
: 
h
VarIsInitializedOp_78VarIsInitializedOp#block_14_depthwise/depthwise_kernel*
_output_shapes
: 
]
VarIsInitializedOp_79VarIsInitializedOpblock_15_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_80VarIsInitializedOpblock_16_expand_BN/beta*
_output_shapes
: 
S
VarIsInitializedOp_81VarIsInitializedOpConv_1_bn/beta*
_output_shapes
: 
c
VarIsInitializedOp_82VarIsInitializedOpblock_16_expand_BN/moving_mean*
_output_shapes
: 
c
VarIsInitializedOp_83VarIsInitializedOpblock_2_project_BN/moving_mean*
_output_shapes
: 
[
VarIsInitializedOp_84VarIsInitializedOpblock_3_project/kernel*
_output_shapes
: 
[
VarIsInitializedOp_85VarIsInitializedOpblock_4_project/kernel*
_output_shapes
: 
\
VarIsInitializedOp_86VarIsInitializedOpblock_5_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_87VarIsInitializedOpblock_6_expand_BN/gamma*
_output_shapes
: 
^
VarIsInitializedOp_88VarIsInitializedOpblock_7_depthwise_BN/beta*
_output_shapes
: 
Z
VarIsInitializedOp_89VarIsInitializedOpblock_8_expand/kernel*
_output_shapes
: 
[
VarIsInitializedOp_90VarIsInitializedOpblock_10_expand/kernel*
_output_shapes
: 
f
VarIsInitializedOp_91VarIsInitializedOp!block_11_depthwise_BN/moving_mean*
_output_shapes
: 
h
VarIsInitializedOp_92VarIsInitializedOp#block_15_depthwise/depthwise_kernel*
_output_shapes
: 
\
VarIsInitializedOp_93VarIsInitializedOpblock_2_project_BN/beta*
_output_shapes
: 
[
VarIsInitializedOp_94VarIsInitializedOpblock_3_expand_BN/beta*
_output_shapes
: 
e
VarIsInitializedOp_95VarIsInitializedOp block_3_depthwise_BN/moving_mean*
_output_shapes
: 
\
VarIsInitializedOp_96VarIsInitializedOpblock_4_project_BN/beta*
_output_shapes
: 
b
VarIsInitializedOp_97VarIsInitializedOpblock_7_expand_BN/moving_mean*
_output_shapes
: 
f
VarIsInitializedOp_98VarIsInitializedOp!block_8_expand_BN/moving_variance*
_output_shapes
: 
\
VarIsInitializedOp_99VarIsInitializedOpblock_10_project/kernel*
_output_shapes
: 
]
VarIsInitializedOp_100VarIsInitializedOpblock_14_expand_BN/beta*
_output_shapes
: 
k
VarIsInitializedOp_101VarIsInitializedOp%block_14_depthwise_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_102VarIsInitializedOpblock_14_project/kernel*
_output_shapes
: 
\
VarIsInitializedOp_103VarIsInitializedOpblock_7_expand_BN/beta*
_output_shapes
: 
c
VarIsInitializedOp_104VarIsInitializedOpblock_8_expand_BN/moving_mean*
_output_shapes
: 
h
VarIsInitializedOp_105VarIsInitializedOp"block_9_project_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_106VarIsInitializedOpblock_12_project/kernel*
_output_shapes
: 
g
VarIsInitializedOp_107VarIsInitializedOp!block_13_depthwise_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_108VarIsInitializedOp!block_14_depthwise_BN/moving_mean*
_output_shapes
: 
^
VarIsInitializedOp_109VarIsInitializedOpblock_14_project_BN/beta*
_output_shapes
: 
h
VarIsInitializedOp_110VarIsInitializedOp"block_15_expand_BN/moving_variance*
_output_shapes
: 
g
VarIsInitializedOp_111VarIsInitializedOp!block_16_depthwise_BN/moving_mean*
_output_shapes
: 
S
VarIsInitializedOp_112VarIsInitializedOpbn_Conv1/beta*
_output_shapes
: 
d
VarIsInitializedOp_113VarIsInitializedOpblock_1_project_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_114VarIsInitializedOp!block_4_expand_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_115VarIsInitializedOp"block_8_project_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_116VarIsInitializedOp"block_11_expand_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_117VarIsInitializedOpblock_13_project_BN/beta*
_output_shapes
: 
^
VarIsInitializedOp_118VarIsInitializedOpblock_14_expand_BN/gamma*
_output_shapes
: 
k
VarIsInitializedOp_119VarIsInitializedOp%block_15_depthwise_BN/moving_variance*
_output_shapes
: 
`
VarIsInitializedOp_120VarIsInitializedOpblock_16_depthwise_BN/beta*
_output_shapes
: 
U
VarIsInitializedOp_121VarIsInitializedOpConv_1_bn/gamma*
_output_shapes
: 
h
VarIsInitializedOp_122VarIsInitializedOp"block_3_depthwise/depthwise_kernel*
_output_shapes
: 
c
VarIsInitializedOp_123VarIsInitializedOpblock_4_expand_BN/moving_mean*
_output_shapes
: 
h
VarIsInitializedOp_124VarIsInitializedOp"block_5_project_BN/moving_variance*
_output_shapes
: 
`
VarIsInitializedOp_125VarIsInitializedOpblock_13_depthwise_BN/beta*
_output_shapes
: 
]
VarIsInitializedOp_126VarIsInitializedOpblock_3_project_BN/beta*
_output_shapes
: 
f
VarIsInitializedOp_127VarIsInitializedOp block_4_depthwise_BN/moving_mean*
_output_shapes
: 
h
VarIsInitializedOp_128VarIsInitializedOp"block_6_project_BN/moving_variance*
_output_shapes
: 
`
VarIsInitializedOp_129VarIsInitializedOpblock_8_depthwise_BN/gamma*
_output_shapes
: 
j
VarIsInitializedOp_130VarIsInitializedOp$block_9_depthwise_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_131VarIsInitializedOpblock_9_project_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_132VarIsInitializedOpblock_14_project_BN/gamma*
_output_shapes
: 
^
VarIsInitializedOp_133VarIsInitializedOpblock_15_expand_BN/gamma*
_output_shapes
: 
d
VarIsInitializedOp_134VarIsInitializedOpblock_15_expand_BN/moving_mean*
_output_shapes
: 
[
VarIsInitializedOp_135VarIsInitializedOpblock_3_expand/kernel*
_output_shapes
: 
j
VarIsInitializedOp_136VarIsInitializedOp$block_1_depthwise_BN/moving_variance*
_output_shapes
: 
f
VarIsInitializedOp_137VarIsInitializedOp block_2_depthwise_BN/moving_mean*
_output_shapes
: 
T
VarIsInitializedOp_138VarIsInitializedOpbn_Conv1/gamma*
_output_shapes
: 
d
VarIsInitializedOp_139VarIsInitializedOpblock_7_project_BN/moving_mean*
_output_shapes
: 
c
VarIsInitializedOp_140VarIsInitializedOpblock_9_expand_BN/moving_mean*
_output_shapes
: 
e
VarIsInitializedOp_141VarIsInitializedOpblock_10_project_BN/moving_mean*
_output_shapes
: 
\
VarIsInitializedOp_142VarIsInitializedOpblock_13_expand/kernel*
_output_shapes
: 
_
VarIsInitializedOp_143VarIsInitializedOpblock_15_project_BN/gamma*
_output_shapes
: 
^
VarIsInitializedOp_144VarIsInitializedOpblock_16_expand_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_145VarIsInitializedOpblock_1_project/kernel*
_output_shapes
: 
^
VarIsInitializedOp_146VarIsInitializedOpblock_5_project_BN/gamma*
_output_shapes
: 
f
VarIsInitializedOp_147VarIsInitializedOp block_8_depthwise_BN/moving_mean*
_output_shapes
: 
^
VarIsInitializedOp_148VarIsInitializedOpbn_Conv1/moving_variance*
_output_shapes
: 
g
VarIsInitializedOp_149VarIsInitializedOp!block_7_expand_BN/moving_variance*
_output_shapes
: 
_
VarIsInitializedOp_150VarIsInitializedOpblock_8_depthwise_BN/beta*
_output_shapes
: 
f
VarIsInitializedOp_151VarIsInitializedOp block_9_depthwise_BN/moving_mean*
_output_shapes
: 
a
VarIsInitializedOp_152VarIsInitializedOpblock_11_depthwise_BN/gamma*
_output_shapes
: 
^
VarIsInitializedOp_153VarIsInitializedOpblock_11_project_BN/beta*
_output_shapes
: 
g
VarIsInitializedOp_154VarIsInitializedOp!block_12_depthwise_BN/moving_mean*
_output_shapes
: 
Y
VarIsInitializedOp_155VarIsInitializedOpdense_Dense1/kernel*
_output_shapes
: 
`
VarIsInitializedOp_156VarIsInitializedOpblock_1_depthwise_BN/gamma*
_output_shapes
: 
h
VarIsInitializedOp_157VarIsInitializedOp"block_3_project_BN/moving_variance*
_output_shapes
: 
[
VarIsInitializedOp_158VarIsInitializedOpblock_6_expand/kernel*
_output_shapes
: 
i
VarIsInitializedOp_159VarIsInitializedOp#block_11_project_BN/moving_variance*
_output_shapes
: 
a
VarIsInitializedOp_160VarIsInitializedOpblock_12_depthwise_BN/gamma*
_output_shapes
: 
]
VarIsInitializedOp_161VarIsInitializedOpblock_4_expand_BN/gamma*
_output_shapes
: 
b
VarIsInitializedOp_162VarIsInitializedOpexpanded_conv_project/kernel*
_output_shapes
: 
`
VarIsInitializedOp_163VarIsInitializedOpblock_2_depthwise_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_164VarIsInitializedOpblock_2_project/kernel*
_output_shapes
: 
c
VarIsInitializedOp_165VarIsInitializedOpblock_5_expand_BN/moving_mean*
_output_shapes
: 
j
VarIsInitializedOp_166VarIsInitializedOp$block_5_depthwise_BN/moving_variance*
_output_shapes
: 
_
VarIsInitializedOp_167VarIsInitializedOpblock_9_depthwise_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_168VarIsInitializedOpblock_9_project/kernel*
_output_shapes
: 
]
VarIsInitializedOp_169VarIsInitializedOpblock_10_expand_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_170VarIsInitializedOpblock_11_expand/kernel*
_output_shapes
: 
`
VarIsInitializedOp_171VarIsInitializedOpblock_14_depthwise_BN/beta*
_output_shapes
: 
]
VarIsInitializedOp_172VarIsInitializedOpblock_15_expand_BN/beta*
_output_shapes
: 
i
VarIsInitializedOp_173VarIsInitializedOp#block_14_project_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_174VarIsInitializedOpblock_2_project_BN/gamma*
_output_shapes
: 
f
VarIsInitializedOp_175VarIsInitializedOp block_5_depthwise_BN/moving_mean*
_output_shapes
: 
g
VarIsInitializedOp_176VarIsInitializedOp!block_9_expand_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_177VarIsInitializedOpblock_10_project_BN/beta*
_output_shapes
: 
i
VarIsInitializedOp_178VarIsInitializedOp#block_13_depthwise/depthwise_kernel*
_output_shapes
: 
i
VarIsInitializedOp_179VarIsInitializedOp#block_15_project_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_180VarIsInitializedOp"block_16_expand_BN/moving_variance*
_output_shapes
: 
a
VarIsInitializedOp_181VarIsInitializedOpblock_16_depthwise_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_182VarIsInitializedOpblock_5_depthwise_BN/beta*
_output_shapes
: 
^
VarIsInitializedOp_183VarIsInitializedOpblock_3_project_BN/gamma*
_output_shapes
: 
f
VarIsInitializedOp_184VarIsInitializedOp block_6_depthwise_BN/moving_mean*
_output_shapes
: 
j
VarIsInitializedOp_185VarIsInitializedOp$block_7_depthwise_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_186VarIsInitializedOp"block_13_expand_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_187VarIsInitializedOpblock_15_project/kernel*
_output_shapes
: 
^
VarIsInitializedOp_188VarIsInitializedOpblock_16_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_189VarIsInitializedOpblock_1_expand_BN/beta*
_output_shapes
: 
g
VarIsInitializedOp_190VarIsInitializedOp!block_6_expand_BN/moving_variance*
_output_shapes
: 
_
VarIsInitializedOp_191VarIsInitializedOpblock_6_depthwise_BN/beta*
_output_shapes
: 
^
VarIsInitializedOp_192VarIsInitializedOpblock_8_project_BN/gamma*
_output_shapes
: 
e
VarIsInitializedOp_193VarIsInitializedOpblock_13_project_BN/moving_mean*
_output_shapes
: 
i
VarIsInitializedOp_194VarIsInitializedOp#block_16_project_BN/moving_variance*
_output_shapes
: 
Z
VarIsInitializedOp_195VarIsInitializedOpbn_Conv1/moving_mean*
_output_shapes
: 
e
VarIsInitializedOp_196VarIsInitializedOpexpanded_conv_depthwise_BN/beta*
_output_shapes
: 
h
VarIsInitializedOp_197VarIsInitializedOp"block_4_depthwise/depthwise_kernel*
_output_shapes
: 
c
VarIsInitializedOp_198VarIsInitializedOpblock_6_expand_BN/moving_mean*
_output_shapes
: 
h
VarIsInitializedOp_199VarIsInitializedOp"block_10_expand_BN/moving_variance*
_output_shapes
: 
R
VarIsInitializedOp_200VarIsInitializedOpConv1/kernel*
_output_shapes
: 
g
VarIsInitializedOp_201VarIsInitializedOp!block_2_expand_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_202VarIsInitializedOpblock_8_project_BN/beta*
_output_shapes
: 
\
VarIsInitializedOp_203VarIsInitializedOpblock_9_expand_BN/beta*
_output_shapes
: 
k
VarIsInitializedOp_204VarIsInitializedOp%block_10_depthwise_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_205VarIsInitializedOpblock_13_project/kernel*
_output_shapes
: 
a
VarIsInitializedOp_206VarIsInitializedOpblock_14_depthwise_BN/gamma*
_output_shapes
: 
g
VarIsInitializedOp_207VarIsInitializedOp!block_15_depthwise_BN/moving_mean*
_output_shapes
: 
k
VarIsInitializedOp_208VarIsInitializedOp%block_16_depthwise_BN/moving_variance*
_output_shapes
: 
W
VarIsInitializedOp_209VarIsInitializedOpdense_Dense1/bias*
_output_shapes
: 
h
VarIsInitializedOp_210VarIsInitializedOp"block_1_depthwise/depthwise_kernel*
_output_shapes
: 
c
VarIsInitializedOp_211VarIsInitializedOpblock_1_expand_BN/moving_mean*
_output_shapes
: 
[
VarIsInitializedOp_212VarIsInitializedOpblock_2_expand/kernel*
_output_shapes
: 
c
VarIsInitializedOp_213VarIsInitializedOpblock_2_expand_BN/moving_mean*
_output_shapes
: 
_
VarIsInitializedOp_214VarIsInitializedOpblock_2_depthwise_BN/beta*
_output_shapes
: 
_
VarIsInitializedOp_215VarIsInitializedOpblock_4_depthwise_BN/beta*
_output_shapes
: 
g
VarIsInitializedOp_216VarIsInitializedOp!block_5_expand_BN/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_217VarIsInitializedOp"block_4_project_BN/moving_variance*
_output_shapes
: 
d
VarIsInitializedOp_218VarIsInitializedOpblock_9_project_BN/moving_mean*
_output_shapes
: 
k
VarIsInitializedOp_219VarIsInitializedOp%block_11_depthwise_BN/moving_variance*
_output_shapes
: 
i
VarIsInitializedOp_220VarIsInitializedOp#block_12_project_BN/moving_variance*
_output_shapes
: 
\
VarIsInitializedOp_221VarIsInitializedOpblock_12_expand/kernel*
_output_shapes
: 
]
VarIsInitializedOp_222VarIsInitializedOpblock_1_project_BN/beta*
_output_shapes
: 
_
VarIsInitializedOp_223VarIsInitializedOpblock_3_depthwise_BN/beta*
_output_shapes
: 
^
VarIsInitializedOp_224VarIsInitializedOpblock_4_project_BN/gamma*
_output_shapes
: 
[
VarIsInitializedOp_225VarIsInitializedOpblock_7_expand/kernel*
_output_shapes
: 
`
VarIsInitializedOp_226VarIsInitializedOpblock_7_depthwise_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_227VarIsInitializedOpblock_8_expand_BN/beta*
_output_shapes
: 
j
VarIsInitializedOp_228VarIsInitializedOp$block_8_depthwise_BN/moving_variance*
_output_shapes
: 
^
VarIsInitializedOp_229VarIsInitializedOpblock_10_expand_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_230VarIsInitializedOpblock_14_expand/kernel*
_output_shapes
: 
`
VarIsInitializedOp_231VarIsInitializedOpblock_15_depthwise_BN/beta*
_output_shapes
: 
[
VarIsInitializedOp_232VarIsInitializedOpblock_4_expand/kernel*
_output_shapes
: 
h
VarIsInitializedOp_233VarIsInitializedOp"block_5_depthwise/depthwise_kernel*
_output_shapes
: 
c
VarIsInitializedOp_234VarIsInitializedOpexpanded_conv_project_BN/beta*
_output_shapes
: 
p
VarIsInitializedOp_235VarIsInitializedOp*expanded_conv_depthwise_BN/moving_variance*
_output_shapes
: 
]
VarIsInitializedOp_236VarIsInitializedOpblock_1_expand_BN/gamma*
_output_shapes
: 
c
VarIsInitializedOp_237VarIsInitializedOpblock_3_expand_BN/moving_mean*
_output_shapes
: 
d
VarIsInitializedOp_238VarIsInitializedOpblock_5_project_BN/moving_mean*
_output_shapes
: 
f
VarIsInitializedOp_239VarIsInitializedOp block_7_depthwise_BN/moving_mean*
_output_shapes
: 
_
VarIsInitializedOp_240VarIsInitializedOpblock_10_project_BN/gamma*
_output_shapes
: 
^
VarIsInitializedOp_241VarIsInitializedOpblock_11_expand_BN/gamma*
_output_shapes
: 
_
VarIsInitializedOp_242VarIsInitializedOpblock_16_project_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_243VarIsInitializedOpblock_4_expand_BN/beta*
_output_shapes
: 
j
VarIsInitializedOp_244VarIsInitializedOp$block_4_depthwise_BN/moving_variance*
_output_shapes
: 
d
VarIsInitializedOp_245VarIsInitializedOpblock_6_project_BN/moving_mean*
_output_shapes
: 
e
VarIsInitializedOp_246VarIsInitializedOpblock_12_project_BN/moving_mean*
_output_shapes
: 
n
VarIsInitializedOp_247VarIsInitializedOp(expanded_conv_depthwise/depthwise_kernel*
_output_shapes
: 
j
VarIsInitializedOp_248VarIsInitializedOp$expanded_conv_project_BN/moving_mean*
_output_shapes
: 
]
VarIsInitializedOp_249VarIsInitializedOpblock_2_expand_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_250VarIsInitializedOpblock_6_project/kernel*
_output_shapes
: 
^
VarIsInitializedOp_251VarIsInitializedOpblock_6_project_BN/gamma*
_output_shapes
: 
\
VarIsInitializedOp_252VarIsInitializedOpblock_7_project/kernel*
_output_shapes
: 
]
VarIsInitializedOp_253VarIsInitializedOpblock_7_project_BN/beta*
_output_shapes
: 
h
VarIsInitializedOp_254VarIsInitializedOp"block_8_depthwise/depthwise_kernel*
_output_shapes
: 
]
VarIsInitializedOp_255VarIsInitializedOpblock_11_expand_BN/beta*
_output_shapes
: 
i
VarIsInitializedOp_256VarIsInitializedOp#block_12_depthwise/depthwise_kernel*
_output_shapes
: 
_
VarIsInitializedOp_257VarIsInitializedOpConv_1_bn/moving_variance*
_output_shapes
: 
h
VarIsInitializedOp_258VarIsInitializedOp"block_1_project_BN/moving_variance*
_output_shapes
: 
d
VarIsInitializedOp_259VarIsInitializedOpblock_13_expand_BN/moving_mean*
_output_shapes
: 
d
VarIsInitializedOp_260VarIsInitializedOpblock_12_expand_BN/moving_mean*
_output_shapes
: 
d
VarIsInitializedOp_261VarIsInitializedOpblock_14_expand_BN/moving_mean*
_output_shapes
: 
j
VarIsInitializedOp_262VarIsInitializedOp$block_6_depthwise_BN/moving_variance*
_output_shapes
: 
?M
initNoOp^Conv1/kernel/Assign^Conv_1/kernel/Assign^Conv_1_bn/beta/Assign^Conv_1_bn/gamma/Assign^Conv_1_bn/moving_mean/Assign!^Conv_1_bn/moving_variance/Assign+^block_10_depthwise/depthwise_kernel/Assign"^block_10_depthwise_BN/beta/Assign#^block_10_depthwise_BN/gamma/Assign)^block_10_depthwise_BN/moving_mean/Assign-^block_10_depthwise_BN/moving_variance/Assign^block_10_expand/kernel/Assign^block_10_expand_BN/beta/Assign ^block_10_expand_BN/gamma/Assign&^block_10_expand_BN/moving_mean/Assign*^block_10_expand_BN/moving_variance/Assign^block_10_project/kernel/Assign ^block_10_project_BN/beta/Assign!^block_10_project_BN/gamma/Assign'^block_10_project_BN/moving_mean/Assign+^block_10_project_BN/moving_variance/Assign+^block_11_depthwise/depthwise_kernel/Assign"^block_11_depthwise_BN/beta/Assign#^block_11_depthwise_BN/gamma/Assign)^block_11_depthwise_BN/moving_mean/Assign-^block_11_depthwise_BN/moving_variance/Assign^block_11_expand/kernel/Assign^block_11_expand_BN/beta/Assign ^block_11_expand_BN/gamma/Assign&^block_11_expand_BN/moving_mean/Assign*^block_11_expand_BN/moving_variance/Assign^block_11_project/kernel/Assign ^block_11_project_BN/beta/Assign!^block_11_project_BN/gamma/Assign'^block_11_project_BN/moving_mean/Assign+^block_11_project_BN/moving_variance/Assign+^block_12_depthwise/depthwise_kernel/Assign"^block_12_depthwise_BN/beta/Assign#^block_12_depthwise_BN/gamma/Assign)^block_12_depthwise_BN/moving_mean/Assign-^block_12_depthwise_BN/moving_variance/Assign^block_12_expand/kernel/Assign^block_12_expand_BN/beta/Assign ^block_12_expand_BN/gamma/Assign&^block_12_expand_BN/moving_mean/Assign*^block_12_expand_BN/moving_variance/Assign^block_12_project/kernel/Assign ^block_12_project_BN/beta/Assign!^block_12_project_BN/gamma/Assign'^block_12_project_BN/moving_mean/Assign+^block_12_project_BN/moving_variance/Assign+^block_13_depthwise/depthwise_kernel/Assign"^block_13_depthwise_BN/beta/Assign#^block_13_depthwise_BN/gamma/Assign)^block_13_depthwise_BN/moving_mean/Assign-^block_13_depthwise_BN/moving_variance/Assign^block_13_expand/kernel/Assign^block_13_expand_BN/beta/Assign ^block_13_expand_BN/gamma/Assign&^block_13_expand_BN/moving_mean/Assign*^block_13_expand_BN/moving_variance/Assign^block_13_project/kernel/Assign ^block_13_project_BN/beta/Assign!^block_13_project_BN/gamma/Assign'^block_13_project_BN/moving_mean/Assign+^block_13_project_BN/moving_variance/Assign+^block_14_depthwise/depthwise_kernel/Assign"^block_14_depthwise_BN/beta/Assign#^block_14_depthwise_BN/gamma/Assign)^block_14_depthwise_BN/moving_mean/Assign-^block_14_depthwise_BN/moving_variance/Assign^block_14_expand/kernel/Assign^block_14_expand_BN/beta/Assign ^block_14_expand_BN/gamma/Assign&^block_14_expand_BN/moving_mean/Assign*^block_14_expand_BN/moving_variance/Assign^block_14_project/kernel/Assign ^block_14_project_BN/beta/Assign!^block_14_project_BN/gamma/Assign'^block_14_project_BN/moving_mean/Assign+^block_14_project_BN/moving_variance/Assign+^block_15_depthwise/depthwise_kernel/Assign"^block_15_depthwise_BN/beta/Assign#^block_15_depthwise_BN/gamma/Assign)^block_15_depthwise_BN/moving_mean/Assign-^block_15_depthwise_BN/moving_variance/Assign^block_15_expand/kernel/Assign^block_15_expand_BN/beta/Assign ^block_15_expand_BN/gamma/Assign&^block_15_expand_BN/moving_mean/Assign*^block_15_expand_BN/moving_variance/Assign^block_15_project/kernel/Assign ^block_15_project_BN/beta/Assign!^block_15_project_BN/gamma/Assign'^block_15_project_BN/moving_mean/Assign+^block_15_project_BN/moving_variance/Assign+^block_16_depthwise/depthwise_kernel/Assign"^block_16_depthwise_BN/beta/Assign#^block_16_depthwise_BN/gamma/Assign)^block_16_depthwise_BN/moving_mean/Assign-^block_16_depthwise_BN/moving_variance/Assign^block_16_expand/kernel/Assign^block_16_expand_BN/beta/Assign ^block_16_expand_BN/gamma/Assign&^block_16_expand_BN/moving_mean/Assign*^block_16_expand_BN/moving_variance/Assign^block_16_project/kernel/Assign ^block_16_project_BN/beta/Assign!^block_16_project_BN/gamma/Assign'^block_16_project_BN/moving_mean/Assign+^block_16_project_BN/moving_variance/Assign*^block_1_depthwise/depthwise_kernel/Assign!^block_1_depthwise_BN/beta/Assign"^block_1_depthwise_BN/gamma/Assign(^block_1_depthwise_BN/moving_mean/Assign,^block_1_depthwise_BN/moving_variance/Assign^block_1_expand/kernel/Assign^block_1_expand_BN/beta/Assign^block_1_expand_BN/gamma/Assign%^block_1_expand_BN/moving_mean/Assign)^block_1_expand_BN/moving_variance/Assign^block_1_project/kernel/Assign^block_1_project_BN/beta/Assign ^block_1_project_BN/gamma/Assign&^block_1_project_BN/moving_mean/Assign*^block_1_project_BN/moving_variance/Assign*^block_2_depthwise/depthwise_kernel/Assign!^block_2_depthwise_BN/beta/Assign"^block_2_depthwise_BN/gamma/Assign(^block_2_depthwise_BN/moving_mean/Assign,^block_2_depthwise_BN/moving_variance/Assign^block_2_expand/kernel/Assign^block_2_expand_BN/beta/Assign^block_2_expand_BN/gamma/Assign%^block_2_expand_BN/moving_mean/Assign)^block_2_expand_BN/moving_variance/Assign^block_2_project/kernel/Assign^block_2_project_BN/beta/Assign ^block_2_project_BN/gamma/Assign&^block_2_project_BN/moving_mean/Assign*^block_2_project_BN/moving_variance/Assign*^block_3_depthwise/depthwise_kernel/Assign!^block_3_depthwise_BN/beta/Assign"^block_3_depthwise_BN/gamma/Assign(^block_3_depthwise_BN/moving_mean/Assign,^block_3_depthwise_BN/moving_variance/Assign^block_3_expand/kernel/Assign^block_3_expand_BN/beta/Assign^block_3_expand_BN/gamma/Assign%^block_3_expand_BN/moving_mean/Assign)^block_3_expand_BN/moving_variance/Assign^block_3_project/kernel/Assign^block_3_project_BN/beta/Assign ^block_3_project_BN/gamma/Assign&^block_3_project_BN/moving_mean/Assign*^block_3_project_BN/moving_variance/Assign*^block_4_depthwise/depthwise_kernel/Assign!^block_4_depthwise_BN/beta/Assign"^block_4_depthwise_BN/gamma/Assign(^block_4_depthwise_BN/moving_mean/Assign,^block_4_depthwise_BN/moving_variance/Assign^block_4_expand/kernel/Assign^block_4_expand_BN/beta/Assign^block_4_expand_BN/gamma/Assign%^block_4_expand_BN/moving_mean/Assign)^block_4_expand_BN/moving_variance/Assign^block_4_project/kernel/Assign^block_4_project_BN/beta/Assign ^block_4_project_BN/gamma/Assign&^block_4_project_BN/moving_mean/Assign*^block_4_project_BN/moving_variance/Assign*^block_5_depthwise/depthwise_kernel/Assign!^block_5_depthwise_BN/beta/Assign"^block_5_depthwise_BN/gamma/Assign(^block_5_depthwise_BN/moving_mean/Assign,^block_5_depthwise_BN/moving_variance/Assign^block_5_expand/kernel/Assign^block_5_expand_BN/beta/Assign^block_5_expand_BN/gamma/Assign%^block_5_expand_BN/moving_mean/Assign)^block_5_expand_BN/moving_variance/Assign^block_5_project/kernel/Assign^block_5_project_BN/beta/Assign ^block_5_project_BN/gamma/Assign&^block_5_project_BN/moving_mean/Assign*^block_5_project_BN/moving_variance/Assign*^block_6_depthwise/depthwise_kernel/Assign!^block_6_depthwise_BN/beta/Assign"^block_6_depthwise_BN/gamma/Assign(^block_6_depthwise_BN/moving_mean/Assign,^block_6_depthwise_BN/moving_variance/Assign^block_6_expand/kernel/Assign^block_6_expand_BN/beta/Assign^block_6_expand_BN/gamma/Assign%^block_6_expand_BN/moving_mean/Assign)^block_6_expand_BN/moving_variance/Assign^block_6_project/kernel/Assign^block_6_project_BN/beta/Assign ^block_6_project_BN/gamma/Assign&^block_6_project_BN/moving_mean/Assign*^block_6_project_BN/moving_variance/Assign*^block_7_depthwise/depthwise_kernel/Assign!^block_7_depthwise_BN/beta/Assign"^block_7_depthwise_BN/gamma/Assign(^block_7_depthwise_BN/moving_mean/Assign,^block_7_depthwise_BN/moving_variance/Assign^block_7_expand/kernel/Assign^block_7_expand_BN/beta/Assign^block_7_expand_BN/gamma/Assign%^block_7_expand_BN/moving_mean/Assign)^block_7_expand_BN/moving_variance/Assign^block_7_project/kernel/Assign^block_7_project_BN/beta/Assign ^block_7_project_BN/gamma/Assign&^block_7_project_BN/moving_mean/Assign*^block_7_project_BN/moving_variance/Assign*^block_8_depthwise/depthwise_kernel/Assign!^block_8_depthwise_BN/beta/Assign"^block_8_depthwise_BN/gamma/Assign(^block_8_depthwise_BN/moving_mean/Assign,^block_8_depthwise_BN/moving_variance/Assign^block_8_expand/kernel/Assign^block_8_expand_BN/beta/Assign^block_8_expand_BN/gamma/Assign%^block_8_expand_BN/moving_mean/Assign)^block_8_expand_BN/moving_variance/Assign^block_8_project/kernel/Assign^block_8_project_BN/beta/Assign ^block_8_project_BN/gamma/Assign&^block_8_project_BN/moving_mean/Assign*^block_8_project_BN/moving_variance/Assign*^block_9_depthwise/depthwise_kernel/Assign!^block_9_depthwise_BN/beta/Assign"^block_9_depthwise_BN/gamma/Assign(^block_9_depthwise_BN/moving_mean/Assign,^block_9_depthwise_BN/moving_variance/Assign^block_9_expand/kernel/Assign^block_9_expand_BN/beta/Assign^block_9_expand_BN/gamma/Assign%^block_9_expand_BN/moving_mean/Assign)^block_9_expand_BN/moving_variance/Assign^block_9_project/kernel/Assign^block_9_project_BN/beta/Assign ^block_9_project_BN/gamma/Assign&^block_9_project_BN/moving_mean/Assign*^block_9_project_BN/moving_variance/Assign^bn_Conv1/beta/Assign^bn_Conv1/gamma/Assign^bn_Conv1/moving_mean/Assign ^bn_Conv1/moving_variance/Assign^dense_Dense1/bias/Assign^dense_Dense1/kernel/Assign^dense_Dense2/kernel/Assign0^expanded_conv_depthwise/depthwise_kernel/Assign'^expanded_conv_depthwise_BN/beta/Assign(^expanded_conv_depthwise_BN/gamma/Assign.^expanded_conv_depthwise_BN/moving_mean/Assign2^expanded_conv_depthwise_BN/moving_variance/Assign$^expanded_conv_project/kernel/Assign%^expanded_conv_project_BN/beta/Assign&^expanded_conv_project_BN/gamma/Assign,^expanded_conv_project_BN/moving_mean/Assign0^expanded_conv_project_BN/moving_variance/Assign
W
Const_1Const"/device:CPU:0*
valueB B *
dtype0*
_output_shapes
: 
W
Const_2Const"/device:CPU:0*
valueB B *
dtype0*
_output_shapes
: 
?
StringJoin/inputs_1Const"/device:CPU:0*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_0a4873af90a64b5893cb4fea31351287/part
f

StringJoin
StringJoinConst_2StringJoin/inputs_1"/device:CPU:0*
N*
_output_shapes
: 
L

num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
f
ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
x
ShardedFilenameShardedFilename
StringJoinShardedFilename/shard
num_shards"/device:CPU:0*
_output_shapes
: 
??
SaveV2/tensor_namesConst"/device:CPU:0*??
value??B???BKlayer_with_weights-1/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBIlayer_with_weights-1/layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-8/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-18/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-20/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-22/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-26/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-28/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-30/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-32/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-34/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-36/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-38/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-40/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-42/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-44/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-46/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-48/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-50/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-52/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-54/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-56/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-58/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-60/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-62/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-64/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-66/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-68/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-70/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-72/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-74/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-76/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-78/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-80/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-82/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-84/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-86/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-88/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-90/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-92/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-94/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-96/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-98/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/gamma/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/beta/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-100/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/gamma/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-101/beta/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-102/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/gamma/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-103/beta/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
dtype0*
_output_shapes	
:?
?
SaveV2/shape_and_slicesConst"/device:CPU:0*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes	
:?
?i
SaveV2SaveV2ShardedFilenameSaveV2/tensor_namesSaveV2/shape_and_slices'dense_Dense1/kernel/Read/ReadVariableOp%dense_Dense1/bias/Read/ReadVariableOp'dense_Dense2/kernel/Read/ReadVariableOp Conv1/kernel/Read/ReadVariableOp"bn_Conv1/gamma/Read/ReadVariableOp!bn_Conv1/beta/Read/ReadVariableOp(bn_Conv1/moving_mean/Read/ReadVariableOp,bn_Conv1/moving_variance/Read/ReadVariableOp<expanded_conv_depthwise/depthwise_kernel/Read/ReadVariableOp4expanded_conv_depthwise_BN/gamma/Read/ReadVariableOp3expanded_conv_depthwise_BN/beta/Read/ReadVariableOp:expanded_conv_depthwise_BN/moving_mean/Read/ReadVariableOp>expanded_conv_depthwise_BN/moving_variance/Read/ReadVariableOp0expanded_conv_project/kernel/Read/ReadVariableOp2expanded_conv_project_BN/gamma/Read/ReadVariableOp1expanded_conv_project_BN/beta/Read/ReadVariableOp8expanded_conv_project_BN/moving_mean/Read/ReadVariableOp<expanded_conv_project_BN/moving_variance/Read/ReadVariableOp)block_1_expand/kernel/Read/ReadVariableOp+block_1_expand_BN/gamma/Read/ReadVariableOp*block_1_expand_BN/beta/Read/ReadVariableOp1block_1_expand_BN/moving_mean/Read/ReadVariableOp5block_1_expand_BN/moving_variance/Read/ReadVariableOp6block_1_depthwise/depthwise_kernel/Read/ReadVariableOp.block_1_depthwise_BN/gamma/Read/ReadVariableOp-block_1_depthwise_BN/beta/Read/ReadVariableOp4block_1_depthwise_BN/moving_mean/Read/ReadVariableOp8block_1_depthwise_BN/moving_variance/Read/ReadVariableOp*block_1_project/kernel/Read/ReadVariableOp,block_1_project_BN/gamma/Read/ReadVariableOp+block_1_project_BN/beta/Read/ReadVariableOp2block_1_project_BN/moving_mean/Read/ReadVariableOp6block_1_project_BN/moving_variance/Read/ReadVariableOp)block_2_expand/kernel/Read/ReadVariableOp+block_2_expand_BN/gamma/Read/ReadVariableOp*block_2_expand_BN/beta/Read/ReadVariableOp1block_2_expand_BN/moving_mean/Read/ReadVariableOp5block_2_expand_BN/moving_variance/Read/ReadVariableOp6block_2_depthwise/depthwise_kernel/Read/ReadVariableOp.block_2_depthwise_BN/gamma/Read/ReadVariableOp-block_2_depthwise_BN/beta/Read/ReadVariableOp4block_2_depthwise_BN/moving_mean/Read/ReadVariableOp8block_2_depthwise_BN/moving_variance/Read/ReadVariableOp*block_2_project/kernel/Read/ReadVariableOp,block_2_project_BN/gamma/Read/ReadVariableOp+block_2_project_BN/beta/Read/ReadVariableOp2block_2_project_BN/moving_mean/Read/ReadVariableOp6block_2_project_BN/moving_variance/Read/ReadVariableOp)block_3_expand/kernel/Read/ReadVariableOp+block_3_expand_BN/gamma/Read/ReadVariableOp*block_3_expand_BN/beta/Read/ReadVariableOp1block_3_expand_BN/moving_mean/Read/ReadVariableOp5block_3_expand_BN/moving_variance/Read/ReadVariableOp6block_3_depthwise/depthwise_kernel/Read/ReadVariableOp.block_3_depthwise_BN/gamma/Read/ReadVariableOp-block_3_depthwise_BN/beta/Read/ReadVariableOp4block_3_depthwise_BN/moving_mean/Read/ReadVariableOp8block_3_depthwise_BN/moving_variance/Read/ReadVariableOp*block_3_project/kernel/Read/ReadVariableOp,block_3_project_BN/gamma/Read/ReadVariableOp+block_3_project_BN/beta/Read/ReadVariableOp2block_3_project_BN/moving_mean/Read/ReadVariableOp6block_3_project_BN/moving_variance/Read/ReadVariableOp)block_4_expand/kernel/Read/ReadVariableOp+block_4_expand_BN/gamma/Read/ReadVariableOp*block_4_expand_BN/beta/Read/ReadVariableOp1block_4_expand_BN/moving_mean/Read/ReadVariableOp5block_4_expand_BN/moving_variance/Read/ReadVariableOp6block_4_depthwise/depthwise_kernel/Read/ReadVariableOp.block_4_depthwise_BN/gamma/Read/ReadVariableOp-block_4_depthwise_BN/beta/Read/ReadVariableOp4block_4_depthwise_BN/moving_mean/Read/ReadVariableOp8block_4_depthwise_BN/moving_variance/Read/ReadVariableOp*block_4_project/kernel/Read/ReadVariableOp,block_4_project_BN/gamma/Read/ReadVariableOp+block_4_project_BN/beta/Read/ReadVariableOp2block_4_project_BN/moving_mean/Read/ReadVariableOp6block_4_project_BN/moving_variance/Read/ReadVariableOp)block_5_expand/kernel/Read/ReadVariableOp+block_5_expand_BN/gamma/Read/ReadVariableOp*block_5_expand_BN/beta/Read/ReadVariableOp1block_5_expand_BN/moving_mean/Read/ReadVariableOp5block_5_expand_BN/moving_variance/Read/ReadVariableOp6block_5_depthwise/depthwise_kernel/Read/ReadVariableOp.block_5_depthwise_BN/gamma/Read/ReadVariableOp-block_5_depthwise_BN/beta/Read/ReadVariableOp4block_5_depthwise_BN/moving_mean/Read/ReadVariableOp8block_5_depthwise_BN/moving_variance/Read/ReadVariableOp*block_5_project/kernel/Read/ReadVariableOp,block_5_project_BN/gamma/Read/ReadVariableOp+block_5_project_BN/beta/Read/ReadVariableOp2block_5_project_BN/moving_mean/Read/ReadVariableOp6block_5_project_BN/moving_variance/Read/ReadVariableOp)block_6_expand/kernel/Read/ReadVariableOp+block_6_expand_BN/gamma/Read/ReadVariableOp*block_6_expand_BN/beta/Read/ReadVariableOp1block_6_expand_BN/moving_mean/Read/ReadVariableOp5block_6_expand_BN/moving_variance/Read/ReadVariableOp6block_6_depthwise/depthwise_kernel/Read/ReadVariableOp.block_6_depthwise_BN/gamma/Read/ReadVariableOp-block_6_depthwise_BN/beta/Read/ReadVariableOp4block_6_depthwise_BN/moving_mean/Read/ReadVariableOp8block_6_depthwise_BN/moving_variance/Read/ReadVariableOp*block_6_project/kernel/Read/ReadVariableOp,block_6_project_BN/gamma/Read/ReadVariableOp+block_6_project_BN/beta/Read/ReadVariableOp2block_6_project_BN/moving_mean/Read/ReadVariableOp6block_6_project_BN/moving_variance/Read/ReadVariableOp)block_7_expand/kernel/Read/ReadVariableOp+block_7_expand_BN/gamma/Read/ReadVariableOp*block_7_expand_BN/beta/Read/ReadVariableOp1block_7_expand_BN/moving_mean/Read/ReadVariableOp5block_7_expand_BN/moving_variance/Read/ReadVariableOp6block_7_depthwise/depthwise_kernel/Read/ReadVariableOp.block_7_depthwise_BN/gamma/Read/ReadVariableOp-block_7_depthwise_BN/beta/Read/ReadVariableOp4block_7_depthwise_BN/moving_mean/Read/ReadVariableOp8block_7_depthwise_BN/moving_variance/Read/ReadVariableOp*block_7_project/kernel/Read/ReadVariableOp,block_7_project_BN/gamma/Read/ReadVariableOp+block_7_project_BN/beta/Read/ReadVariableOp2block_7_project_BN/moving_mean/Read/ReadVariableOp6block_7_project_BN/moving_variance/Read/ReadVariableOp)block_8_expand/kernel/Read/ReadVariableOp+block_8_expand_BN/gamma/Read/ReadVariableOp*block_8_expand_BN/beta/Read/ReadVariableOp1block_8_expand_BN/moving_mean/Read/ReadVariableOp5block_8_expand_BN/moving_variance/Read/ReadVariableOp6block_8_depthwise/depthwise_kernel/Read/ReadVariableOp.block_8_depthwise_BN/gamma/Read/ReadVariableOp-block_8_depthwise_BN/beta/Read/ReadVariableOp4block_8_depthwise_BN/moving_mean/Read/ReadVariableOp8block_8_depthwise_BN/moving_variance/Read/ReadVariableOp*block_8_project/kernel/Read/ReadVariableOp,block_8_project_BN/gamma/Read/ReadVariableOp+block_8_project_BN/beta/Read/ReadVariableOp2block_8_project_BN/moving_mean/Read/ReadVariableOp6block_8_project_BN/moving_variance/Read/ReadVariableOp)block_9_expand/kernel/Read/ReadVariableOp+block_9_expand_BN/gamma/Read/ReadVariableOp*block_9_expand_BN/beta/Read/ReadVariableOp1block_9_expand_BN/moving_mean/Read/ReadVariableOp5block_9_expand_BN/moving_variance/Read/ReadVariableOp6block_9_depthwise/depthwise_kernel/Read/ReadVariableOp.block_9_depthwise_BN/gamma/Read/ReadVariableOp-block_9_depthwise_BN/beta/Read/ReadVariableOp4block_9_depthwise_BN/moving_mean/Read/ReadVariableOp8block_9_depthwise_BN/moving_variance/Read/ReadVariableOp*block_9_project/kernel/Read/ReadVariableOp,block_9_project_BN/gamma/Read/ReadVariableOp+block_9_project_BN/beta/Read/ReadVariableOp2block_9_project_BN/moving_mean/Read/ReadVariableOp6block_9_project_BN/moving_variance/Read/ReadVariableOp*block_10_expand/kernel/Read/ReadVariableOp,block_10_expand_BN/gamma/Read/ReadVariableOp+block_10_expand_BN/beta/Read/ReadVariableOp2block_10_expand_BN/moving_mean/Read/ReadVariableOp6block_10_expand_BN/moving_variance/Read/ReadVariableOp7block_10_depthwise/depthwise_kernel/Read/ReadVariableOp/block_10_depthwise_BN/gamma/Read/ReadVariableOp.block_10_depthwise_BN/beta/Read/ReadVariableOp5block_10_depthwise_BN/moving_mean/Read/ReadVariableOp9block_10_depthwise_BN/moving_variance/Read/ReadVariableOp+block_10_project/kernel/Read/ReadVariableOp-block_10_project_BN/gamma/Read/ReadVariableOp,block_10_project_BN/beta/Read/ReadVariableOp3block_10_project_BN/moving_mean/Read/ReadVariableOp7block_10_project_BN/moving_variance/Read/ReadVariableOp*block_11_expand/kernel/Read/ReadVariableOp,block_11_expand_BN/gamma/Read/ReadVariableOp+block_11_expand_BN/beta/Read/ReadVariableOp2block_11_expand_BN/moving_mean/Read/ReadVariableOp6block_11_expand_BN/moving_variance/Read/ReadVariableOp7block_11_depthwise/depthwise_kernel/Read/ReadVariableOp/block_11_depthwise_BN/gamma/Read/ReadVariableOp.block_11_depthwise_BN/beta/Read/ReadVariableOp5block_11_depthwise_BN/moving_mean/Read/ReadVariableOp9block_11_depthwise_BN/moving_variance/Read/ReadVariableOp+block_11_project/kernel/Read/ReadVariableOp-block_11_project_BN/gamma/Read/ReadVariableOp,block_11_project_BN/beta/Read/ReadVariableOp3block_11_project_BN/moving_mean/Read/ReadVariableOp7block_11_project_BN/moving_variance/Read/ReadVariableOp*block_12_expand/kernel/Read/ReadVariableOp,block_12_expand_BN/gamma/Read/ReadVariableOp+block_12_expand_BN/beta/Read/ReadVariableOp2block_12_expand_BN/moving_mean/Read/ReadVariableOp6block_12_expand_BN/moving_variance/Read/ReadVariableOp7block_12_depthwise/depthwise_kernel/Read/ReadVariableOp/block_12_depthwise_BN/gamma/Read/ReadVariableOp.block_12_depthwise_BN/beta/Read/ReadVariableOp5block_12_depthwise_BN/moving_mean/Read/ReadVariableOp9block_12_depthwise_BN/moving_variance/Read/ReadVariableOp+block_12_project/kernel/Read/ReadVariableOp-block_12_project_BN/gamma/Read/ReadVariableOp,block_12_project_BN/beta/Read/ReadVariableOp3block_12_project_BN/moving_mean/Read/ReadVariableOp7block_12_project_BN/moving_variance/Read/ReadVariableOp*block_13_expand/kernel/Read/ReadVariableOp,block_13_expand_BN/gamma/Read/ReadVariableOp+block_13_expand_BN/beta/Read/ReadVariableOp2block_13_expand_BN/moving_mean/Read/ReadVariableOp6block_13_expand_BN/moving_variance/Read/ReadVariableOp7block_13_depthwise/depthwise_kernel/Read/ReadVariableOp/block_13_depthwise_BN/gamma/Read/ReadVariableOp.block_13_depthwise_BN/beta/Read/ReadVariableOp5block_13_depthwise_BN/moving_mean/Read/ReadVariableOp9block_13_depthwise_BN/moving_variance/Read/ReadVariableOp+block_13_project/kernel/Read/ReadVariableOp-block_13_project_BN/gamma/Read/ReadVariableOp,block_13_project_BN/beta/Read/ReadVariableOp3block_13_project_BN/moving_mean/Read/ReadVariableOp7block_13_project_BN/moving_variance/Read/ReadVariableOp*block_14_expand/kernel/Read/ReadVariableOp,block_14_expand_BN/gamma/Read/ReadVariableOp+block_14_expand_BN/beta/Read/ReadVariableOp2block_14_expand_BN/moving_mean/Read/ReadVariableOp6block_14_expand_BN/moving_variance/Read/ReadVariableOp7block_14_depthwise/depthwise_kernel/Read/ReadVariableOp/block_14_depthwise_BN/gamma/Read/ReadVariableOp.block_14_depthwise_BN/beta/Read/ReadVariableOp5block_14_depthwise_BN/moving_mean/Read/ReadVariableOp9block_14_depthwise_BN/moving_variance/Read/ReadVariableOp+block_14_project/kernel/Read/ReadVariableOp-block_14_project_BN/gamma/Read/ReadVariableOp,block_14_project_BN/beta/Read/ReadVariableOp3block_14_project_BN/moving_mean/Read/ReadVariableOp7block_14_project_BN/moving_variance/Read/ReadVariableOp*block_15_expand/kernel/Read/ReadVariableOp,block_15_expand_BN/gamma/Read/ReadVariableOp+block_15_expand_BN/beta/Read/ReadVariableOp2block_15_expand_BN/moving_mean/Read/ReadVariableOp6block_15_expand_BN/moving_variance/Read/ReadVariableOp7block_15_depthwise/depthwise_kernel/Read/ReadVariableOp/block_15_depthwise_BN/gamma/Read/ReadVariableOp.block_15_depthwise_BN/beta/Read/ReadVariableOp5block_15_depthwise_BN/moving_mean/Read/ReadVariableOp9block_15_depthwise_BN/moving_variance/Read/ReadVariableOp+block_15_project/kernel/Read/ReadVariableOp-block_15_project_BN/gamma/Read/ReadVariableOp,block_15_project_BN/beta/Read/ReadVariableOp3block_15_project_BN/moving_mean/Read/ReadVariableOp7block_15_project_BN/moving_variance/Read/ReadVariableOp*block_16_expand/kernel/Read/ReadVariableOp,block_16_expand_BN/gamma/Read/ReadVariableOp+block_16_expand_BN/beta/Read/ReadVariableOp2block_16_expand_BN/moving_mean/Read/ReadVariableOp6block_16_expand_BN/moving_variance/Read/ReadVariableOp7block_16_depthwise/depthwise_kernel/Read/ReadVariableOp/block_16_depthwise_BN/gamma/Read/ReadVariableOp.block_16_depthwise_BN/beta/Read/ReadVariableOp5block_16_depthwise_BN/moving_mean/Read/ReadVariableOp9block_16_depthwise_BN/moving_variance/Read/ReadVariableOp+block_16_project/kernel/Read/ReadVariableOp-block_16_project_BN/gamma/Read/ReadVariableOp,block_16_project_BN/beta/Read/ReadVariableOp3block_16_project_BN/moving_mean/Read/ReadVariableOp7block_16_project_BN/moving_variance/Read/ReadVariableOp!Conv_1/kernel/Read/ReadVariableOp#Conv_1_bn/gamma/Read/ReadVariableOp"Conv_1_bn/beta/Read/ReadVariableOp)Conv_1_bn/moving_mean/Read/ReadVariableOp-Conv_1_bn/moving_variance/Read/ReadVariableOp"/device:CPU:0*?
dtypes?
?2?
h
ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
|
ShardedFilename_1ShardedFilename
StringJoinShardedFilename_1/shard
num_shards"/device:CPU:0*
_output_shapes
: 
?
SaveV2_1/tensor_namesConst"/device:CPU:0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH*
dtype0*
_output_shapes
:
q
SaveV2_1/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
?
SaveV2_1SaveV2ShardedFilename_1SaveV2_1/tensor_namesSaveV2_1/shape_and_slicesConst_1"/device:CPU:0*
dtypes
2
?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilenameShardedFilename_1^SaveV2	^SaveV2_1"/device:CPU:0*
N*
_output_shapes
:*
T0
h
MergeV2CheckpointsMergeV2Checkpoints&MergeV2Checkpoints/checkpoint_prefixesConst_2"/device:CPU:0
f
Identity_263IdentityConst_2^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
??
save/SaveV2/tensor_namesConst*??
value??B???B`layer_with_weights-0/layer_with_weights-0/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-100/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-101/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-102/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-103/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-18/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-20/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-22/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-26/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-28/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-30/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-32/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-34/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-36/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-38/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-40/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-42/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-44/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-46/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-48/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-50/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-52/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-54/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-56/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-58/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-60/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-62/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-64/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-66/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-68/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-70/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-72/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-74/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-76/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-78/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-8/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-80/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-82/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-84/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-86/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-88/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-90/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-92/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-94/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-96/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-98/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBIlayer_with_weights-1/layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
dtype0*
_output_shapes	
:?
?
save/SaveV2/shape_and_slicesConst*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes	
:?
?i
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slices Conv1/kernel/Read/ReadVariableOp!bn_Conv1/beta/Read/ReadVariableOp"bn_Conv1/gamma/Read/ReadVariableOp(bn_Conv1/moving_mean/Read/ReadVariableOp,bn_Conv1/moving_variance/Read/ReadVariableOp*block_1_project/kernel/Read/ReadVariableOp+block_16_project/kernel/Read/ReadVariableOp,block_16_project_BN/beta/Read/ReadVariableOp-block_16_project_BN/gamma/Read/ReadVariableOp3block_16_project_BN/moving_mean/Read/ReadVariableOp7block_16_project_BN/moving_variance/Read/ReadVariableOp!Conv_1/kernel/Read/ReadVariableOp"Conv_1_bn/beta/Read/ReadVariableOp#Conv_1_bn/gamma/Read/ReadVariableOp)Conv_1_bn/moving_mean/Read/ReadVariableOp-Conv_1_bn/moving_variance/Read/ReadVariableOp+block_1_project_BN/beta/Read/ReadVariableOp,block_1_project_BN/gamma/Read/ReadVariableOp2block_1_project_BN/moving_mean/Read/ReadVariableOp6block_1_project_BN/moving_variance/Read/ReadVariableOp)block_2_expand/kernel/Read/ReadVariableOp*block_2_expand_BN/beta/Read/ReadVariableOp+block_2_expand_BN/gamma/Read/ReadVariableOp1block_2_expand_BN/moving_mean/Read/ReadVariableOp5block_2_expand_BN/moving_variance/Read/ReadVariableOp6block_2_depthwise/depthwise_kernel/Read/ReadVariableOp-block_2_depthwise_BN/beta/Read/ReadVariableOp.block_2_depthwise_BN/gamma/Read/ReadVariableOp4block_2_depthwise_BN/moving_mean/Read/ReadVariableOp8block_2_depthwise_BN/moving_variance/Read/ReadVariableOp*block_2_project/kernel/Read/ReadVariableOp+block_2_project_BN/beta/Read/ReadVariableOp,block_2_project_BN/gamma/Read/ReadVariableOp2block_2_project_BN/moving_mean/Read/ReadVariableOp6block_2_project_BN/moving_variance/Read/ReadVariableOp)block_3_expand/kernel/Read/ReadVariableOp*block_3_expand_BN/beta/Read/ReadVariableOp+block_3_expand_BN/gamma/Read/ReadVariableOp1block_3_expand_BN/moving_mean/Read/ReadVariableOp5block_3_expand_BN/moving_variance/Read/ReadVariableOp<expanded_conv_depthwise/depthwise_kernel/Read/ReadVariableOp6block_3_depthwise/depthwise_kernel/Read/ReadVariableOp-block_3_depthwise_BN/beta/Read/ReadVariableOp.block_3_depthwise_BN/gamma/Read/ReadVariableOp4block_3_depthwise_BN/moving_mean/Read/ReadVariableOp8block_3_depthwise_BN/moving_variance/Read/ReadVariableOp*block_3_project/kernel/Read/ReadVariableOp+block_3_project_BN/beta/Read/ReadVariableOp,block_3_project_BN/gamma/Read/ReadVariableOp2block_3_project_BN/moving_mean/Read/ReadVariableOp6block_3_project_BN/moving_variance/Read/ReadVariableOp)block_4_expand/kernel/Read/ReadVariableOp*block_4_expand_BN/beta/Read/ReadVariableOp+block_4_expand_BN/gamma/Read/ReadVariableOp1block_4_expand_BN/moving_mean/Read/ReadVariableOp5block_4_expand_BN/moving_variance/Read/ReadVariableOp6block_4_depthwise/depthwise_kernel/Read/ReadVariableOp-block_4_depthwise_BN/beta/Read/ReadVariableOp.block_4_depthwise_BN/gamma/Read/ReadVariableOp4block_4_depthwise_BN/moving_mean/Read/ReadVariableOp8block_4_depthwise_BN/moving_variance/Read/ReadVariableOp*block_4_project/kernel/Read/ReadVariableOp+block_4_project_BN/beta/Read/ReadVariableOp,block_4_project_BN/gamma/Read/ReadVariableOp2block_4_project_BN/moving_mean/Read/ReadVariableOp6block_4_project_BN/moving_variance/Read/ReadVariableOp3expanded_conv_depthwise_BN/beta/Read/ReadVariableOp4expanded_conv_depthwise_BN/gamma/Read/ReadVariableOp:expanded_conv_depthwise_BN/moving_mean/Read/ReadVariableOp>expanded_conv_depthwise_BN/moving_variance/Read/ReadVariableOp)block_5_expand/kernel/Read/ReadVariableOp*block_5_expand_BN/beta/Read/ReadVariableOp+block_5_expand_BN/gamma/Read/ReadVariableOp1block_5_expand_BN/moving_mean/Read/ReadVariableOp5block_5_expand_BN/moving_variance/Read/ReadVariableOp6block_5_depthwise/depthwise_kernel/Read/ReadVariableOp-block_5_depthwise_BN/beta/Read/ReadVariableOp.block_5_depthwise_BN/gamma/Read/ReadVariableOp4block_5_depthwise_BN/moving_mean/Read/ReadVariableOp8block_5_depthwise_BN/moving_variance/Read/ReadVariableOp*block_5_project/kernel/Read/ReadVariableOp+block_5_project_BN/beta/Read/ReadVariableOp,block_5_project_BN/gamma/Read/ReadVariableOp2block_5_project_BN/moving_mean/Read/ReadVariableOp6block_5_project_BN/moving_variance/Read/ReadVariableOp)block_6_expand/kernel/Read/ReadVariableOp*block_6_expand_BN/beta/Read/ReadVariableOp+block_6_expand_BN/gamma/Read/ReadVariableOp1block_6_expand_BN/moving_mean/Read/ReadVariableOp5block_6_expand_BN/moving_variance/Read/ReadVariableOp6block_6_depthwise/depthwise_kernel/Read/ReadVariableOp-block_6_depthwise_BN/beta/Read/ReadVariableOp.block_6_depthwise_BN/gamma/Read/ReadVariableOp4block_6_depthwise_BN/moving_mean/Read/ReadVariableOp8block_6_depthwise_BN/moving_variance/Read/ReadVariableOp0expanded_conv_project/kernel/Read/ReadVariableOp*block_6_project/kernel/Read/ReadVariableOp+block_6_project_BN/beta/Read/ReadVariableOp,block_6_project_BN/gamma/Read/ReadVariableOp2block_6_project_BN/moving_mean/Read/ReadVariableOp6block_6_project_BN/moving_variance/Read/ReadVariableOp)block_7_expand/kernel/Read/ReadVariableOp*block_7_expand_BN/beta/Read/ReadVariableOp+block_7_expand_BN/gamma/Read/ReadVariableOp1block_7_expand_BN/moving_mean/Read/ReadVariableOp5block_7_expand_BN/moving_variance/Read/ReadVariableOp6block_7_depthwise/depthwise_kernel/Read/ReadVariableOp-block_7_depthwise_BN/beta/Read/ReadVariableOp.block_7_depthwise_BN/gamma/Read/ReadVariableOp4block_7_depthwise_BN/moving_mean/Read/ReadVariableOp8block_7_depthwise_BN/moving_variance/Read/ReadVariableOp*block_7_project/kernel/Read/ReadVariableOp+block_7_project_BN/beta/Read/ReadVariableOp,block_7_project_BN/gamma/Read/ReadVariableOp2block_7_project_BN/moving_mean/Read/ReadVariableOp6block_7_project_BN/moving_variance/Read/ReadVariableOp)block_8_expand/kernel/Read/ReadVariableOp*block_8_expand_BN/beta/Read/ReadVariableOp+block_8_expand_BN/gamma/Read/ReadVariableOp1block_8_expand_BN/moving_mean/Read/ReadVariableOp5block_8_expand_BN/moving_variance/Read/ReadVariableOp1expanded_conv_project_BN/beta/Read/ReadVariableOp2expanded_conv_project_BN/gamma/Read/ReadVariableOp8expanded_conv_project_BN/moving_mean/Read/ReadVariableOp<expanded_conv_project_BN/moving_variance/Read/ReadVariableOp6block_8_depthwise/depthwise_kernel/Read/ReadVariableOp-block_8_depthwise_BN/beta/Read/ReadVariableOp.block_8_depthwise_BN/gamma/Read/ReadVariableOp4block_8_depthwise_BN/moving_mean/Read/ReadVariableOp8block_8_depthwise_BN/moving_variance/Read/ReadVariableOp*block_8_project/kernel/Read/ReadVariableOp+block_8_project_BN/beta/Read/ReadVariableOp,block_8_project_BN/gamma/Read/ReadVariableOp2block_8_project_BN/moving_mean/Read/ReadVariableOp6block_8_project_BN/moving_variance/Read/ReadVariableOp)block_9_expand/kernel/Read/ReadVariableOp*block_9_expand_BN/beta/Read/ReadVariableOp+block_9_expand_BN/gamma/Read/ReadVariableOp1block_9_expand_BN/moving_mean/Read/ReadVariableOp5block_9_expand_BN/moving_variance/Read/ReadVariableOp6block_9_depthwise/depthwise_kernel/Read/ReadVariableOp-block_9_depthwise_BN/beta/Read/ReadVariableOp.block_9_depthwise_BN/gamma/Read/ReadVariableOp4block_9_depthwise_BN/moving_mean/Read/ReadVariableOp8block_9_depthwise_BN/moving_variance/Read/ReadVariableOp*block_9_project/kernel/Read/ReadVariableOp+block_9_project_BN/beta/Read/ReadVariableOp,block_9_project_BN/gamma/Read/ReadVariableOp2block_9_project_BN/moving_mean/Read/ReadVariableOp6block_9_project_BN/moving_variance/Read/ReadVariableOp)block_1_expand/kernel/Read/ReadVariableOp*block_10_expand/kernel/Read/ReadVariableOp+block_10_expand_BN/beta/Read/ReadVariableOp,block_10_expand_BN/gamma/Read/ReadVariableOp2block_10_expand_BN/moving_mean/Read/ReadVariableOp6block_10_expand_BN/moving_variance/Read/ReadVariableOp7block_10_depthwise/depthwise_kernel/Read/ReadVariableOp.block_10_depthwise_BN/beta/Read/ReadVariableOp/block_10_depthwise_BN/gamma/Read/ReadVariableOp5block_10_depthwise_BN/moving_mean/Read/ReadVariableOp9block_10_depthwise_BN/moving_variance/Read/ReadVariableOp+block_10_project/kernel/Read/ReadVariableOp,block_10_project_BN/beta/Read/ReadVariableOp-block_10_project_BN/gamma/Read/ReadVariableOp3block_10_project_BN/moving_mean/Read/ReadVariableOp7block_10_project_BN/moving_variance/Read/ReadVariableOp*block_11_expand/kernel/Read/ReadVariableOp+block_11_expand_BN/beta/Read/ReadVariableOp,block_11_expand_BN/gamma/Read/ReadVariableOp2block_11_expand_BN/moving_mean/Read/ReadVariableOp6block_11_expand_BN/moving_variance/Read/ReadVariableOp7block_11_depthwise/depthwise_kernel/Read/ReadVariableOp.block_11_depthwise_BN/beta/Read/ReadVariableOp/block_11_depthwise_BN/gamma/Read/ReadVariableOp5block_11_depthwise_BN/moving_mean/Read/ReadVariableOp9block_11_depthwise_BN/moving_variance/Read/ReadVariableOp*block_1_expand_BN/beta/Read/ReadVariableOp+block_1_expand_BN/gamma/Read/ReadVariableOp1block_1_expand_BN/moving_mean/Read/ReadVariableOp5block_1_expand_BN/moving_variance/Read/ReadVariableOp+block_11_project/kernel/Read/ReadVariableOp,block_11_project_BN/beta/Read/ReadVariableOp-block_11_project_BN/gamma/Read/ReadVariableOp3block_11_project_BN/moving_mean/Read/ReadVariableOp7block_11_project_BN/moving_variance/Read/ReadVariableOp*block_12_expand/kernel/Read/ReadVariableOp+block_12_expand_BN/beta/Read/ReadVariableOp,block_12_expand_BN/gamma/Read/ReadVariableOp2block_12_expand_BN/moving_mean/Read/ReadVariableOp6block_12_expand_BN/moving_variance/Read/ReadVariableOp7block_12_depthwise/depthwise_kernel/Read/ReadVariableOp.block_12_depthwise_BN/beta/Read/ReadVariableOp/block_12_depthwise_BN/gamma/Read/ReadVariableOp5block_12_depthwise_BN/moving_mean/Read/ReadVariableOp9block_12_depthwise_BN/moving_variance/Read/ReadVariableOp+block_12_project/kernel/Read/ReadVariableOp,block_12_project_BN/beta/Read/ReadVariableOp-block_12_project_BN/gamma/Read/ReadVariableOp3block_12_project_BN/moving_mean/Read/ReadVariableOp7block_12_project_BN/moving_variance/Read/ReadVariableOp*block_13_expand/kernel/Read/ReadVariableOp+block_13_expand_BN/beta/Read/ReadVariableOp,block_13_expand_BN/gamma/Read/ReadVariableOp2block_13_expand_BN/moving_mean/Read/ReadVariableOp6block_13_expand_BN/moving_variance/Read/ReadVariableOp6block_1_depthwise/depthwise_kernel/Read/ReadVariableOp7block_13_depthwise/depthwise_kernel/Read/ReadVariableOp.block_13_depthwise_BN/beta/Read/ReadVariableOp/block_13_depthwise_BN/gamma/Read/ReadVariableOp5block_13_depthwise_BN/moving_mean/Read/ReadVariableOp9block_13_depthwise_BN/moving_variance/Read/ReadVariableOp+block_13_project/kernel/Read/ReadVariableOp,block_13_project_BN/beta/Read/ReadVariableOp-block_13_project_BN/gamma/Read/ReadVariableOp3block_13_project_BN/moving_mean/Read/ReadVariableOp7block_13_project_BN/moving_variance/Read/ReadVariableOp*block_14_expand/kernel/Read/ReadVariableOp+block_14_expand_BN/beta/Read/ReadVariableOp,block_14_expand_BN/gamma/Read/ReadVariableOp2block_14_expand_BN/moving_mean/Read/ReadVariableOp6block_14_expand_BN/moving_variance/Read/ReadVariableOp7block_14_depthwise/depthwise_kernel/Read/ReadVariableOp.block_14_depthwise_BN/beta/Read/ReadVariableOp/block_14_depthwise_BN/gamma/Read/ReadVariableOp5block_14_depthwise_BN/moving_mean/Read/ReadVariableOp9block_14_depthwise_BN/moving_variance/Read/ReadVariableOp+block_14_project/kernel/Read/ReadVariableOp,block_14_project_BN/beta/Read/ReadVariableOp-block_14_project_BN/gamma/Read/ReadVariableOp3block_14_project_BN/moving_mean/Read/ReadVariableOp7block_14_project_BN/moving_variance/Read/ReadVariableOp-block_1_depthwise_BN/beta/Read/ReadVariableOp.block_1_depthwise_BN/gamma/Read/ReadVariableOp4block_1_depthwise_BN/moving_mean/Read/ReadVariableOp8block_1_depthwise_BN/moving_variance/Read/ReadVariableOp*block_15_expand/kernel/Read/ReadVariableOp+block_15_expand_BN/beta/Read/ReadVariableOp,block_15_expand_BN/gamma/Read/ReadVariableOp2block_15_expand_BN/moving_mean/Read/ReadVariableOp6block_15_expand_BN/moving_variance/Read/ReadVariableOp7block_15_depthwise/depthwise_kernel/Read/ReadVariableOp.block_15_depthwise_BN/beta/Read/ReadVariableOp/block_15_depthwise_BN/gamma/Read/ReadVariableOp5block_15_depthwise_BN/moving_mean/Read/ReadVariableOp9block_15_depthwise_BN/moving_variance/Read/ReadVariableOp+block_15_project/kernel/Read/ReadVariableOp,block_15_project_BN/beta/Read/ReadVariableOp-block_15_project_BN/gamma/Read/ReadVariableOp3block_15_project_BN/moving_mean/Read/ReadVariableOp7block_15_project_BN/moving_variance/Read/ReadVariableOp*block_16_expand/kernel/Read/ReadVariableOp+block_16_expand_BN/beta/Read/ReadVariableOp,block_16_expand_BN/gamma/Read/ReadVariableOp2block_16_expand_BN/moving_mean/Read/ReadVariableOp6block_16_expand_BN/moving_variance/Read/ReadVariableOp7block_16_depthwise/depthwise_kernel/Read/ReadVariableOp.block_16_depthwise_BN/beta/Read/ReadVariableOp/block_16_depthwise_BN/gamma/Read/ReadVariableOp5block_16_depthwise_BN/moving_mean/Read/ReadVariableOp9block_16_depthwise_BN/moving_variance/Read/ReadVariableOp%dense_Dense1/bias/Read/ReadVariableOp'dense_Dense1/kernel/Read/ReadVariableOp'dense_Dense2/kernel/Read/ReadVariableOp*?
dtypes?
?2?
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
??
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes	
:?*??
value??B???B`layer_with_weights-0/layer_with_weights-0/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-100/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-101/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-101/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBblayer_with_weights-0/layer_with_weights-0/layer_with_weights-102/kernel/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-103/beta/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/gamma/.ATTRIBUTES/VARIABLE_VALUEBglayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-103/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-13/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-17/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-18/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-20/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-21/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-22/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-23/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-25/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-26/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-27/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-27/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-28/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-29/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-29/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-30/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-31/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-31/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-32/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-33/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-33/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-34/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-35/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-35/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-36/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-37/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-37/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-38/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-39/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-39/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-40/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-41/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-41/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-42/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-43/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-43/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-44/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-45/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-45/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-46/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-47/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-47/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-48/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-49/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-49/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-50/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-51/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-51/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-52/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-53/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-53/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-54/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-55/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-55/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-56/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-57/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-57/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-58/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-59/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-59/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-60/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-61/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-61/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-62/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-63/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-63/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-64/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-65/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-65/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-66/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-67/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-67/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-68/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-69/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-69/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-70/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-71/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-71/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-72/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-73/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-73/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-74/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-75/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-75/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-76/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-77/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-77/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-78/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-79/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-79/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-8/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-80/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-81/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-81/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-82/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-83/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-83/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-84/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-85/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-85/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-86/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-87/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-87/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-88/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-89/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-89/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB^layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEBelayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBilayer_with_weights-0/layer_with_weights-0/layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-90/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-91/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-91/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-92/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-93/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-93/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-94/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-95/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-95/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBalayer_with_weights-0/layer_with_weights-0/layer_with_weights-96/kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-97/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-97/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBklayer_with_weights-0/layer_with_weights-0/layer_with_weights-98/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB_layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/beta/.ATTRIBUTES/VARIABLE_VALUEB`layer_with_weights-0/layer_with_weights-0/layer_with_weights-99/gamma/.ATTRIBUTES/VARIABLE_VALUEBflayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_mean/.ATTRIBUTES/VARIABLE_VALUEBjlayer_with_weights-0/layer_with_weights-0/layer_with_weights-99/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBIlayer_with_weights-1/layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEBKlayer_with_weights-1/layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes	
:?
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*?
dtypes?
?2?*?
_output_shapes?
?:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
L
save/IdentityIdentitysave/RestoreV2*
T0*
_output_shapes
:
S
save/AssignVariableOpAssignVariableOpConv1/kernelsave/Identity*
dtype0
P
save/Identity_1Identitysave/RestoreV2:1*
T0*
_output_shapes
:
X
save/AssignVariableOp_1AssignVariableOpbn_Conv1/betasave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:2*
T0*
_output_shapes
:
Y
save/AssignVariableOp_2AssignVariableOpbn_Conv1/gammasave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:3*
T0*
_output_shapes
:
_
save/AssignVariableOp_3AssignVariableOpbn_Conv1/moving_meansave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:4*
T0*
_output_shapes
:
c
save/AssignVariableOp_4AssignVariableOpbn_Conv1/moving_variancesave/Identity_4*
dtype0
P
save/Identity_5Identitysave/RestoreV2:5*
T0*
_output_shapes
:
a
save/AssignVariableOp_5AssignVariableOpblock_1_project/kernelsave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:6*
T0*
_output_shapes
:
b
save/AssignVariableOp_6AssignVariableOpblock_16_project/kernelsave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:7*
T0*
_output_shapes
:
c
save/AssignVariableOp_7AssignVariableOpblock_16_project_BN/betasave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:8*
T0*
_output_shapes
:
d
save/AssignVariableOp_8AssignVariableOpblock_16_project_BN/gammasave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:9*
T0*
_output_shapes
:
j
save/AssignVariableOp_9AssignVariableOpblock_16_project_BN/moving_meansave/Identity_9*
dtype0
R
save/Identity_10Identitysave/RestoreV2:10*
T0*
_output_shapes
:
p
save/AssignVariableOp_10AssignVariableOp#block_16_project_BN/moving_variancesave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:11*
_output_shapes
:*
T0
Z
save/AssignVariableOp_11AssignVariableOpConv_1/kernelsave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:12*
_output_shapes
:*
T0
[
save/AssignVariableOp_12AssignVariableOpConv_1_bn/betasave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:13*
T0*
_output_shapes
:
\
save/AssignVariableOp_13AssignVariableOpConv_1_bn/gammasave/Identity_13*
dtype0
R
save/Identity_14Identitysave/RestoreV2:14*
T0*
_output_shapes
:
b
save/AssignVariableOp_14AssignVariableOpConv_1_bn/moving_meansave/Identity_14*
dtype0
R
save/Identity_15Identitysave/RestoreV2:15*
T0*
_output_shapes
:
f
save/AssignVariableOp_15AssignVariableOpConv_1_bn/moving_variancesave/Identity_15*
dtype0
R
save/Identity_16Identitysave/RestoreV2:16*
T0*
_output_shapes
:
d
save/AssignVariableOp_16AssignVariableOpblock_1_project_BN/betasave/Identity_16*
dtype0
R
save/Identity_17Identitysave/RestoreV2:17*
T0*
_output_shapes
:
e
save/AssignVariableOp_17AssignVariableOpblock_1_project_BN/gammasave/Identity_17*
dtype0
R
save/Identity_18Identitysave/RestoreV2:18*
T0*
_output_shapes
:
k
save/AssignVariableOp_18AssignVariableOpblock_1_project_BN/moving_meansave/Identity_18*
dtype0
R
save/Identity_19Identitysave/RestoreV2:19*
T0*
_output_shapes
:
o
save/AssignVariableOp_19AssignVariableOp"block_1_project_BN/moving_variancesave/Identity_19*
dtype0
R
save/Identity_20Identitysave/RestoreV2:20*
T0*
_output_shapes
:
b
save/AssignVariableOp_20AssignVariableOpblock_2_expand/kernelsave/Identity_20*
dtype0
R
save/Identity_21Identitysave/RestoreV2:21*
T0*
_output_shapes
:
c
save/AssignVariableOp_21AssignVariableOpblock_2_expand_BN/betasave/Identity_21*
dtype0
R
save/Identity_22Identitysave/RestoreV2:22*
_output_shapes
:*
T0
d
save/AssignVariableOp_22AssignVariableOpblock_2_expand_BN/gammasave/Identity_22*
dtype0
R
save/Identity_23Identitysave/RestoreV2:23*
T0*
_output_shapes
:
j
save/AssignVariableOp_23AssignVariableOpblock_2_expand_BN/moving_meansave/Identity_23*
dtype0
R
save/Identity_24Identitysave/RestoreV2:24*
T0*
_output_shapes
:
n
save/AssignVariableOp_24AssignVariableOp!block_2_expand_BN/moving_variancesave/Identity_24*
dtype0
R
save/Identity_25Identitysave/RestoreV2:25*
T0*
_output_shapes
:
o
save/AssignVariableOp_25AssignVariableOp"block_2_depthwise/depthwise_kernelsave/Identity_25*
dtype0
R
save/Identity_26Identitysave/RestoreV2:26*
_output_shapes
:*
T0
f
save/AssignVariableOp_26AssignVariableOpblock_2_depthwise_BN/betasave/Identity_26*
dtype0
R
save/Identity_27Identitysave/RestoreV2:27*
T0*
_output_shapes
:
g
save/AssignVariableOp_27AssignVariableOpblock_2_depthwise_BN/gammasave/Identity_27*
dtype0
R
save/Identity_28Identitysave/RestoreV2:28*
T0*
_output_shapes
:
m
save/AssignVariableOp_28AssignVariableOp block_2_depthwise_BN/moving_meansave/Identity_28*
dtype0
R
save/Identity_29Identitysave/RestoreV2:29*
_output_shapes
:*
T0
q
save/AssignVariableOp_29AssignVariableOp$block_2_depthwise_BN/moving_variancesave/Identity_29*
dtype0
R
save/Identity_30Identitysave/RestoreV2:30*
T0*
_output_shapes
:
c
save/AssignVariableOp_30AssignVariableOpblock_2_project/kernelsave/Identity_30*
dtype0
R
save/Identity_31Identitysave/RestoreV2:31*
_output_shapes
:*
T0
d
save/AssignVariableOp_31AssignVariableOpblock_2_project_BN/betasave/Identity_31*
dtype0
R
save/Identity_32Identitysave/RestoreV2:32*
_output_shapes
:*
T0
e
save/AssignVariableOp_32AssignVariableOpblock_2_project_BN/gammasave/Identity_32*
dtype0
R
save/Identity_33Identitysave/RestoreV2:33*
T0*
_output_shapes
:
k
save/AssignVariableOp_33AssignVariableOpblock_2_project_BN/moving_meansave/Identity_33*
dtype0
R
save/Identity_34Identitysave/RestoreV2:34*
T0*
_output_shapes
:
o
save/AssignVariableOp_34AssignVariableOp"block_2_project_BN/moving_variancesave/Identity_34*
dtype0
R
save/Identity_35Identitysave/RestoreV2:35*
T0*
_output_shapes
:
b
save/AssignVariableOp_35AssignVariableOpblock_3_expand/kernelsave/Identity_35*
dtype0
R
save/Identity_36Identitysave/RestoreV2:36*
T0*
_output_shapes
:
c
save/AssignVariableOp_36AssignVariableOpblock_3_expand_BN/betasave/Identity_36*
dtype0
R
save/Identity_37Identitysave/RestoreV2:37*
T0*
_output_shapes
:
d
save/AssignVariableOp_37AssignVariableOpblock_3_expand_BN/gammasave/Identity_37*
dtype0
R
save/Identity_38Identitysave/RestoreV2:38*
T0*
_output_shapes
:
j
save/AssignVariableOp_38AssignVariableOpblock_3_expand_BN/moving_meansave/Identity_38*
dtype0
R
save/Identity_39Identitysave/RestoreV2:39*
T0*
_output_shapes
:
n
save/AssignVariableOp_39AssignVariableOp!block_3_expand_BN/moving_variancesave/Identity_39*
dtype0
R
save/Identity_40Identitysave/RestoreV2:40*
T0*
_output_shapes
:
u
save/AssignVariableOp_40AssignVariableOp(expanded_conv_depthwise/depthwise_kernelsave/Identity_40*
dtype0
R
save/Identity_41Identitysave/RestoreV2:41*
_output_shapes
:*
T0
o
save/AssignVariableOp_41AssignVariableOp"block_3_depthwise/depthwise_kernelsave/Identity_41*
dtype0
R
save/Identity_42Identitysave/RestoreV2:42*
_output_shapes
:*
T0
f
save/AssignVariableOp_42AssignVariableOpblock_3_depthwise_BN/betasave/Identity_42*
dtype0
R
save/Identity_43Identitysave/RestoreV2:43*
T0*
_output_shapes
:
g
save/AssignVariableOp_43AssignVariableOpblock_3_depthwise_BN/gammasave/Identity_43*
dtype0
R
save/Identity_44Identitysave/RestoreV2:44*
T0*
_output_shapes
:
m
save/AssignVariableOp_44AssignVariableOp block_3_depthwise_BN/moving_meansave/Identity_44*
dtype0
R
save/Identity_45Identitysave/RestoreV2:45*
T0*
_output_shapes
:
q
save/AssignVariableOp_45AssignVariableOp$block_3_depthwise_BN/moving_variancesave/Identity_45*
dtype0
R
save/Identity_46Identitysave/RestoreV2:46*
T0*
_output_shapes
:
c
save/AssignVariableOp_46AssignVariableOpblock_3_project/kernelsave/Identity_46*
dtype0
R
save/Identity_47Identitysave/RestoreV2:47*
T0*
_output_shapes
:
d
save/AssignVariableOp_47AssignVariableOpblock_3_project_BN/betasave/Identity_47*
dtype0
R
save/Identity_48Identitysave/RestoreV2:48*
_output_shapes
:*
T0
e
save/AssignVariableOp_48AssignVariableOpblock_3_project_BN/gammasave/Identity_48*
dtype0
R
save/Identity_49Identitysave/RestoreV2:49*
T0*
_output_shapes
:
k
save/AssignVariableOp_49AssignVariableOpblock_3_project_BN/moving_meansave/Identity_49*
dtype0
R
save/Identity_50Identitysave/RestoreV2:50*
T0*
_output_shapes
:
o
save/AssignVariableOp_50AssignVariableOp"block_3_project_BN/moving_variancesave/Identity_50*
dtype0
R
save/Identity_51Identitysave/RestoreV2:51*
T0*
_output_shapes
:
b
save/AssignVariableOp_51AssignVariableOpblock_4_expand/kernelsave/Identity_51*
dtype0
R
save/Identity_52Identitysave/RestoreV2:52*
T0*
_output_shapes
:
c
save/AssignVariableOp_52AssignVariableOpblock_4_expand_BN/betasave/Identity_52*
dtype0
R
save/Identity_53Identitysave/RestoreV2:53*
_output_shapes
:*
T0
d
save/AssignVariableOp_53AssignVariableOpblock_4_expand_BN/gammasave/Identity_53*
dtype0
R
save/Identity_54Identitysave/RestoreV2:54*
T0*
_output_shapes
:
j
save/AssignVariableOp_54AssignVariableOpblock_4_expand_BN/moving_meansave/Identity_54*
dtype0
R
save/Identity_55Identitysave/RestoreV2:55*
T0*
_output_shapes
:
n
save/AssignVariableOp_55AssignVariableOp!block_4_expand_BN/moving_variancesave/Identity_55*
dtype0
R
save/Identity_56Identitysave/RestoreV2:56*
_output_shapes
:*
T0
o
save/AssignVariableOp_56AssignVariableOp"block_4_depthwise/depthwise_kernelsave/Identity_56*
dtype0
R
save/Identity_57Identitysave/RestoreV2:57*
T0*
_output_shapes
:
f
save/AssignVariableOp_57AssignVariableOpblock_4_depthwise_BN/betasave/Identity_57*
dtype0
R
save/Identity_58Identitysave/RestoreV2:58*
T0*
_output_shapes
:
g
save/AssignVariableOp_58AssignVariableOpblock_4_depthwise_BN/gammasave/Identity_58*
dtype0
R
save/Identity_59Identitysave/RestoreV2:59*
T0*
_output_shapes
:
m
save/AssignVariableOp_59AssignVariableOp block_4_depthwise_BN/moving_meansave/Identity_59*
dtype0
R
save/Identity_60Identitysave/RestoreV2:60*
T0*
_output_shapes
:
q
save/AssignVariableOp_60AssignVariableOp$block_4_depthwise_BN/moving_variancesave/Identity_60*
dtype0
R
save/Identity_61Identitysave/RestoreV2:61*
T0*
_output_shapes
:
c
save/AssignVariableOp_61AssignVariableOpblock_4_project/kernelsave/Identity_61*
dtype0
R
save/Identity_62Identitysave/RestoreV2:62*
_output_shapes
:*
T0
d
save/AssignVariableOp_62AssignVariableOpblock_4_project_BN/betasave/Identity_62*
dtype0
R
save/Identity_63Identitysave/RestoreV2:63*
_output_shapes
:*
T0
e
save/AssignVariableOp_63AssignVariableOpblock_4_project_BN/gammasave/Identity_63*
dtype0
R
save/Identity_64Identitysave/RestoreV2:64*
T0*
_output_shapes
:
k
save/AssignVariableOp_64AssignVariableOpblock_4_project_BN/moving_meansave/Identity_64*
dtype0
R
save/Identity_65Identitysave/RestoreV2:65*
T0*
_output_shapes
:
o
save/AssignVariableOp_65AssignVariableOp"block_4_project_BN/moving_variancesave/Identity_65*
dtype0
R
save/Identity_66Identitysave/RestoreV2:66*
_output_shapes
:*
T0
l
save/AssignVariableOp_66AssignVariableOpexpanded_conv_depthwise_BN/betasave/Identity_66*
dtype0
R
save/Identity_67Identitysave/RestoreV2:67*
T0*
_output_shapes
:
m
save/AssignVariableOp_67AssignVariableOp expanded_conv_depthwise_BN/gammasave/Identity_67*
dtype0
R
save/Identity_68Identitysave/RestoreV2:68*
_output_shapes
:*
T0
s
save/AssignVariableOp_68AssignVariableOp&expanded_conv_depthwise_BN/moving_meansave/Identity_68*
dtype0
R
save/Identity_69Identitysave/RestoreV2:69*
T0*
_output_shapes
:
w
save/AssignVariableOp_69AssignVariableOp*expanded_conv_depthwise_BN/moving_variancesave/Identity_69*
dtype0
R
save/Identity_70Identitysave/RestoreV2:70*
T0*
_output_shapes
:
b
save/AssignVariableOp_70AssignVariableOpblock_5_expand/kernelsave/Identity_70*
dtype0
R
save/Identity_71Identitysave/RestoreV2:71*
T0*
_output_shapes
:
c
save/AssignVariableOp_71AssignVariableOpblock_5_expand_BN/betasave/Identity_71*
dtype0
R
save/Identity_72Identitysave/RestoreV2:72*
T0*
_output_shapes
:
d
save/AssignVariableOp_72AssignVariableOpblock_5_expand_BN/gammasave/Identity_72*
dtype0
R
save/Identity_73Identitysave/RestoreV2:73*
T0*
_output_shapes
:
j
save/AssignVariableOp_73AssignVariableOpblock_5_expand_BN/moving_meansave/Identity_73*
dtype0
R
save/Identity_74Identitysave/RestoreV2:74*
_output_shapes
:*
T0
n
save/AssignVariableOp_74AssignVariableOp!block_5_expand_BN/moving_variancesave/Identity_74*
dtype0
R
save/Identity_75Identitysave/RestoreV2:75*
T0*
_output_shapes
:
o
save/AssignVariableOp_75AssignVariableOp"block_5_depthwise/depthwise_kernelsave/Identity_75*
dtype0
R
save/Identity_76Identitysave/RestoreV2:76*
T0*
_output_shapes
:
f
save/AssignVariableOp_76AssignVariableOpblock_5_depthwise_BN/betasave/Identity_76*
dtype0
R
save/Identity_77Identitysave/RestoreV2:77*
T0*
_output_shapes
:
g
save/AssignVariableOp_77AssignVariableOpblock_5_depthwise_BN/gammasave/Identity_77*
dtype0
R
save/Identity_78Identitysave/RestoreV2:78*
T0*
_output_shapes
:
m
save/AssignVariableOp_78AssignVariableOp block_5_depthwise_BN/moving_meansave/Identity_78*
dtype0
R
save/Identity_79Identitysave/RestoreV2:79*
T0*
_output_shapes
:
q
save/AssignVariableOp_79AssignVariableOp$block_5_depthwise_BN/moving_variancesave/Identity_79*
dtype0
R
save/Identity_80Identitysave/RestoreV2:80*
T0*
_output_shapes
:
c
save/AssignVariableOp_80AssignVariableOpblock_5_project/kernelsave/Identity_80*
dtype0
R
save/Identity_81Identitysave/RestoreV2:81*
T0*
_output_shapes
:
d
save/AssignVariableOp_81AssignVariableOpblock_5_project_BN/betasave/Identity_81*
dtype0
R
save/Identity_82Identitysave/RestoreV2:82*
T0*
_output_shapes
:
e
save/AssignVariableOp_82AssignVariableOpblock_5_project_BN/gammasave/Identity_82*
dtype0
R
save/Identity_83Identitysave/RestoreV2:83*
T0*
_output_shapes
:
k
save/AssignVariableOp_83AssignVariableOpblock_5_project_BN/moving_meansave/Identity_83*
dtype0
R
save/Identity_84Identitysave/RestoreV2:84*
T0*
_output_shapes
:
o
save/AssignVariableOp_84AssignVariableOp"block_5_project_BN/moving_variancesave/Identity_84*
dtype0
R
save/Identity_85Identitysave/RestoreV2:85*
_output_shapes
:*
T0
b
save/AssignVariableOp_85AssignVariableOpblock_6_expand/kernelsave/Identity_85*
dtype0
R
save/Identity_86Identitysave/RestoreV2:86*
T0*
_output_shapes
:
c
save/AssignVariableOp_86AssignVariableOpblock_6_expand_BN/betasave/Identity_86*
dtype0
R
save/Identity_87Identitysave/RestoreV2:87*
T0*
_output_shapes
:
d
save/AssignVariableOp_87AssignVariableOpblock_6_expand_BN/gammasave/Identity_87*
dtype0
R
save/Identity_88Identitysave/RestoreV2:88*
T0*
_output_shapes
:
j
save/AssignVariableOp_88AssignVariableOpblock_6_expand_BN/moving_meansave/Identity_88*
dtype0
R
save/Identity_89Identitysave/RestoreV2:89*
_output_shapes
:*
T0
n
save/AssignVariableOp_89AssignVariableOp!block_6_expand_BN/moving_variancesave/Identity_89*
dtype0
R
save/Identity_90Identitysave/RestoreV2:90*
T0*
_output_shapes
:
o
save/AssignVariableOp_90AssignVariableOp"block_6_depthwise/depthwise_kernelsave/Identity_90*
dtype0
R
save/Identity_91Identitysave/RestoreV2:91*
T0*
_output_shapes
:
f
save/AssignVariableOp_91AssignVariableOpblock_6_depthwise_BN/betasave/Identity_91*
dtype0
R
save/Identity_92Identitysave/RestoreV2:92*
T0*
_output_shapes
:
g
save/AssignVariableOp_92AssignVariableOpblock_6_depthwise_BN/gammasave/Identity_92*
dtype0
R
save/Identity_93Identitysave/RestoreV2:93*
T0*
_output_shapes
:
m
save/AssignVariableOp_93AssignVariableOp block_6_depthwise_BN/moving_meansave/Identity_93*
dtype0
R
save/Identity_94Identitysave/RestoreV2:94*
T0*
_output_shapes
:
q
save/AssignVariableOp_94AssignVariableOp$block_6_depthwise_BN/moving_variancesave/Identity_94*
dtype0
R
save/Identity_95Identitysave/RestoreV2:95*
_output_shapes
:*
T0
i
save/AssignVariableOp_95AssignVariableOpexpanded_conv_project/kernelsave/Identity_95*
dtype0
R
save/Identity_96Identitysave/RestoreV2:96*
_output_shapes
:*
T0
c
save/AssignVariableOp_96AssignVariableOpblock_6_project/kernelsave/Identity_96*
dtype0
R
save/Identity_97Identitysave/RestoreV2:97*
T0*
_output_shapes
:
d
save/AssignVariableOp_97AssignVariableOpblock_6_project_BN/betasave/Identity_97*
dtype0
R
save/Identity_98Identitysave/RestoreV2:98*
_output_shapes
:*
T0
e
save/AssignVariableOp_98AssignVariableOpblock_6_project_BN/gammasave/Identity_98*
dtype0
R
save/Identity_99Identitysave/RestoreV2:99*
T0*
_output_shapes
:
k
save/AssignVariableOp_99AssignVariableOpblock_6_project_BN/moving_meansave/Identity_99*
dtype0
T
save/Identity_100Identitysave/RestoreV2:100*
_output_shapes
:*
T0
q
save/AssignVariableOp_100AssignVariableOp"block_6_project_BN/moving_variancesave/Identity_100*
dtype0
T
save/Identity_101Identitysave/RestoreV2:101*
_output_shapes
:*
T0
d
save/AssignVariableOp_101AssignVariableOpblock_7_expand/kernelsave/Identity_101*
dtype0
T
save/Identity_102Identitysave/RestoreV2:102*
_output_shapes
:*
T0
e
save/AssignVariableOp_102AssignVariableOpblock_7_expand_BN/betasave/Identity_102*
dtype0
T
save/Identity_103Identitysave/RestoreV2:103*
_output_shapes
:*
T0
f
save/AssignVariableOp_103AssignVariableOpblock_7_expand_BN/gammasave/Identity_103*
dtype0
T
save/Identity_104Identitysave/RestoreV2:104*
T0*
_output_shapes
:
l
save/AssignVariableOp_104AssignVariableOpblock_7_expand_BN/moving_meansave/Identity_104*
dtype0
T
save/Identity_105Identitysave/RestoreV2:105*
T0*
_output_shapes
:
p
save/AssignVariableOp_105AssignVariableOp!block_7_expand_BN/moving_variancesave/Identity_105*
dtype0
T
save/Identity_106Identitysave/RestoreV2:106*
_output_shapes
:*
T0
q
save/AssignVariableOp_106AssignVariableOp"block_7_depthwise/depthwise_kernelsave/Identity_106*
dtype0
T
save/Identity_107Identitysave/RestoreV2:107*
T0*
_output_shapes
:
h
save/AssignVariableOp_107AssignVariableOpblock_7_depthwise_BN/betasave/Identity_107*
dtype0
T
save/Identity_108Identitysave/RestoreV2:108*
T0*
_output_shapes
:
i
save/AssignVariableOp_108AssignVariableOpblock_7_depthwise_BN/gammasave/Identity_108*
dtype0
T
save/Identity_109Identitysave/RestoreV2:109*
T0*
_output_shapes
:
o
save/AssignVariableOp_109AssignVariableOp block_7_depthwise_BN/moving_meansave/Identity_109*
dtype0
T
save/Identity_110Identitysave/RestoreV2:110*
T0*
_output_shapes
:
s
save/AssignVariableOp_110AssignVariableOp$block_7_depthwise_BN/moving_variancesave/Identity_110*
dtype0
T
save/Identity_111Identitysave/RestoreV2:111*
T0*
_output_shapes
:
e
save/AssignVariableOp_111AssignVariableOpblock_7_project/kernelsave/Identity_111*
dtype0
T
save/Identity_112Identitysave/RestoreV2:112*
T0*
_output_shapes
:
f
save/AssignVariableOp_112AssignVariableOpblock_7_project_BN/betasave/Identity_112*
dtype0
T
save/Identity_113Identitysave/RestoreV2:113*
T0*
_output_shapes
:
g
save/AssignVariableOp_113AssignVariableOpblock_7_project_BN/gammasave/Identity_113*
dtype0
T
save/Identity_114Identitysave/RestoreV2:114*
T0*
_output_shapes
:
m
save/AssignVariableOp_114AssignVariableOpblock_7_project_BN/moving_meansave/Identity_114*
dtype0
T
save/Identity_115Identitysave/RestoreV2:115*
T0*
_output_shapes
:
q
save/AssignVariableOp_115AssignVariableOp"block_7_project_BN/moving_variancesave/Identity_115*
dtype0
T
save/Identity_116Identitysave/RestoreV2:116*
T0*
_output_shapes
:
d
save/AssignVariableOp_116AssignVariableOpblock_8_expand/kernelsave/Identity_116*
dtype0
T
save/Identity_117Identitysave/RestoreV2:117*
T0*
_output_shapes
:
e
save/AssignVariableOp_117AssignVariableOpblock_8_expand_BN/betasave/Identity_117*
dtype0
T
save/Identity_118Identitysave/RestoreV2:118*
_output_shapes
:*
T0
f
save/AssignVariableOp_118AssignVariableOpblock_8_expand_BN/gammasave/Identity_118*
dtype0
T
save/Identity_119Identitysave/RestoreV2:119*
T0*
_output_shapes
:
l
save/AssignVariableOp_119AssignVariableOpblock_8_expand_BN/moving_meansave/Identity_119*
dtype0
T
save/Identity_120Identitysave/RestoreV2:120*
T0*
_output_shapes
:
p
save/AssignVariableOp_120AssignVariableOp!block_8_expand_BN/moving_variancesave/Identity_120*
dtype0
T
save/Identity_121Identitysave/RestoreV2:121*
_output_shapes
:*
T0
l
save/AssignVariableOp_121AssignVariableOpexpanded_conv_project_BN/betasave/Identity_121*
dtype0
T
save/Identity_122Identitysave/RestoreV2:122*
_output_shapes
:*
T0
m
save/AssignVariableOp_122AssignVariableOpexpanded_conv_project_BN/gammasave/Identity_122*
dtype0
T
save/Identity_123Identitysave/RestoreV2:123*
T0*
_output_shapes
:
s
save/AssignVariableOp_123AssignVariableOp$expanded_conv_project_BN/moving_meansave/Identity_123*
dtype0
T
save/Identity_124Identitysave/RestoreV2:124*
T0*
_output_shapes
:
w
save/AssignVariableOp_124AssignVariableOp(expanded_conv_project_BN/moving_variancesave/Identity_124*
dtype0
T
save/Identity_125Identitysave/RestoreV2:125*
T0*
_output_shapes
:
q
save/AssignVariableOp_125AssignVariableOp"block_8_depthwise/depthwise_kernelsave/Identity_125*
dtype0
T
save/Identity_126Identitysave/RestoreV2:126*
T0*
_output_shapes
:
h
save/AssignVariableOp_126AssignVariableOpblock_8_depthwise_BN/betasave/Identity_126*
dtype0
T
save/Identity_127Identitysave/RestoreV2:127*
_output_shapes
:*
T0
i
save/AssignVariableOp_127AssignVariableOpblock_8_depthwise_BN/gammasave/Identity_127*
dtype0
T
save/Identity_128Identitysave/RestoreV2:128*
T0*
_output_shapes
:
o
save/AssignVariableOp_128AssignVariableOp block_8_depthwise_BN/moving_meansave/Identity_128*
dtype0
T
save/Identity_129Identitysave/RestoreV2:129*
_output_shapes
:*
T0
s
save/AssignVariableOp_129AssignVariableOp$block_8_depthwise_BN/moving_variancesave/Identity_129*
dtype0
T
save/Identity_130Identitysave/RestoreV2:130*
T0*
_output_shapes
:
e
save/AssignVariableOp_130AssignVariableOpblock_8_project/kernelsave/Identity_130*
dtype0
T
save/Identity_131Identitysave/RestoreV2:131*
T0*
_output_shapes
:
f
save/AssignVariableOp_131AssignVariableOpblock_8_project_BN/betasave/Identity_131*
dtype0
T
save/Identity_132Identitysave/RestoreV2:132*
T0*
_output_shapes
:
g
save/AssignVariableOp_132AssignVariableOpblock_8_project_BN/gammasave/Identity_132*
dtype0
T
save/Identity_133Identitysave/RestoreV2:133*
T0*
_output_shapes
:
m
save/AssignVariableOp_133AssignVariableOpblock_8_project_BN/moving_meansave/Identity_133*
dtype0
T
save/Identity_134Identitysave/RestoreV2:134*
T0*
_output_shapes
:
q
save/AssignVariableOp_134AssignVariableOp"block_8_project_BN/moving_variancesave/Identity_134*
dtype0
T
save/Identity_135Identitysave/RestoreV2:135*
_output_shapes
:*
T0
d
save/AssignVariableOp_135AssignVariableOpblock_9_expand/kernelsave/Identity_135*
dtype0
T
save/Identity_136Identitysave/RestoreV2:136*
T0*
_output_shapes
:
e
save/AssignVariableOp_136AssignVariableOpblock_9_expand_BN/betasave/Identity_136*
dtype0
T
save/Identity_137Identitysave/RestoreV2:137*
T0*
_output_shapes
:
f
save/AssignVariableOp_137AssignVariableOpblock_9_expand_BN/gammasave/Identity_137*
dtype0
T
save/Identity_138Identitysave/RestoreV2:138*
T0*
_output_shapes
:
l
save/AssignVariableOp_138AssignVariableOpblock_9_expand_BN/moving_meansave/Identity_138*
dtype0
T
save/Identity_139Identitysave/RestoreV2:139*
T0*
_output_shapes
:
p
save/AssignVariableOp_139AssignVariableOp!block_9_expand_BN/moving_variancesave/Identity_139*
dtype0
T
save/Identity_140Identitysave/RestoreV2:140*
T0*
_output_shapes
:
q
save/AssignVariableOp_140AssignVariableOp"block_9_depthwise/depthwise_kernelsave/Identity_140*
dtype0
T
save/Identity_141Identitysave/RestoreV2:141*
_output_shapes
:*
T0
h
save/AssignVariableOp_141AssignVariableOpblock_9_depthwise_BN/betasave/Identity_141*
dtype0
T
save/Identity_142Identitysave/RestoreV2:142*
_output_shapes
:*
T0
i
save/AssignVariableOp_142AssignVariableOpblock_9_depthwise_BN/gammasave/Identity_142*
dtype0
T
save/Identity_143Identitysave/RestoreV2:143*
T0*
_output_shapes
:
o
save/AssignVariableOp_143AssignVariableOp block_9_depthwise_BN/moving_meansave/Identity_143*
dtype0
T
save/Identity_144Identitysave/RestoreV2:144*
T0*
_output_shapes
:
s
save/AssignVariableOp_144AssignVariableOp$block_9_depthwise_BN/moving_variancesave/Identity_144*
dtype0
T
save/Identity_145Identitysave/RestoreV2:145*
_output_shapes
:*
T0
e
save/AssignVariableOp_145AssignVariableOpblock_9_project/kernelsave/Identity_145*
dtype0
T
save/Identity_146Identitysave/RestoreV2:146*
T0*
_output_shapes
:
f
save/AssignVariableOp_146AssignVariableOpblock_9_project_BN/betasave/Identity_146*
dtype0
T
save/Identity_147Identitysave/RestoreV2:147*
T0*
_output_shapes
:
g
save/AssignVariableOp_147AssignVariableOpblock_9_project_BN/gammasave/Identity_147*
dtype0
T
save/Identity_148Identitysave/RestoreV2:148*
_output_shapes
:*
T0
m
save/AssignVariableOp_148AssignVariableOpblock_9_project_BN/moving_meansave/Identity_148*
dtype0
T
save/Identity_149Identitysave/RestoreV2:149*
_output_shapes
:*
T0
q
save/AssignVariableOp_149AssignVariableOp"block_9_project_BN/moving_variancesave/Identity_149*
dtype0
T
save/Identity_150Identitysave/RestoreV2:150*
T0*
_output_shapes
:
d
save/AssignVariableOp_150AssignVariableOpblock_1_expand/kernelsave/Identity_150*
dtype0
T
save/Identity_151Identitysave/RestoreV2:151*
_output_shapes
:*
T0
e
save/AssignVariableOp_151AssignVariableOpblock_10_expand/kernelsave/Identity_151*
dtype0
T
save/Identity_152Identitysave/RestoreV2:152*
T0*
_output_shapes
:
f
save/AssignVariableOp_152AssignVariableOpblock_10_expand_BN/betasave/Identity_152*
dtype0
T
save/Identity_153Identitysave/RestoreV2:153*
T0*
_output_shapes
:
g
save/AssignVariableOp_153AssignVariableOpblock_10_expand_BN/gammasave/Identity_153*
dtype0
T
save/Identity_154Identitysave/RestoreV2:154*
_output_shapes
:*
T0
m
save/AssignVariableOp_154AssignVariableOpblock_10_expand_BN/moving_meansave/Identity_154*
dtype0
T
save/Identity_155Identitysave/RestoreV2:155*
T0*
_output_shapes
:
q
save/AssignVariableOp_155AssignVariableOp"block_10_expand_BN/moving_variancesave/Identity_155*
dtype0
T
save/Identity_156Identitysave/RestoreV2:156*
T0*
_output_shapes
:
r
save/AssignVariableOp_156AssignVariableOp#block_10_depthwise/depthwise_kernelsave/Identity_156*
dtype0
T
save/Identity_157Identitysave/RestoreV2:157*
T0*
_output_shapes
:
i
save/AssignVariableOp_157AssignVariableOpblock_10_depthwise_BN/betasave/Identity_157*
dtype0
T
save/Identity_158Identitysave/RestoreV2:158*
T0*
_output_shapes
:
j
save/AssignVariableOp_158AssignVariableOpblock_10_depthwise_BN/gammasave/Identity_158*
dtype0
T
save/Identity_159Identitysave/RestoreV2:159*
T0*
_output_shapes
:
p
save/AssignVariableOp_159AssignVariableOp!block_10_depthwise_BN/moving_meansave/Identity_159*
dtype0
T
save/Identity_160Identitysave/RestoreV2:160*
T0*
_output_shapes
:
t
save/AssignVariableOp_160AssignVariableOp%block_10_depthwise_BN/moving_variancesave/Identity_160*
dtype0
T
save/Identity_161Identitysave/RestoreV2:161*
T0*
_output_shapes
:
f
save/AssignVariableOp_161AssignVariableOpblock_10_project/kernelsave/Identity_161*
dtype0
T
save/Identity_162Identitysave/RestoreV2:162*
_output_shapes
:*
T0
g
save/AssignVariableOp_162AssignVariableOpblock_10_project_BN/betasave/Identity_162*
dtype0
T
save/Identity_163Identitysave/RestoreV2:163*
T0*
_output_shapes
:
h
save/AssignVariableOp_163AssignVariableOpblock_10_project_BN/gammasave/Identity_163*
dtype0
T
save/Identity_164Identitysave/RestoreV2:164*
T0*
_output_shapes
:
n
save/AssignVariableOp_164AssignVariableOpblock_10_project_BN/moving_meansave/Identity_164*
dtype0
T
save/Identity_165Identitysave/RestoreV2:165*
T0*
_output_shapes
:
r
save/AssignVariableOp_165AssignVariableOp#block_10_project_BN/moving_variancesave/Identity_165*
dtype0
T
save/Identity_166Identitysave/RestoreV2:166*
T0*
_output_shapes
:
e
save/AssignVariableOp_166AssignVariableOpblock_11_expand/kernelsave/Identity_166*
dtype0
T
save/Identity_167Identitysave/RestoreV2:167*
_output_shapes
:*
T0
f
save/AssignVariableOp_167AssignVariableOpblock_11_expand_BN/betasave/Identity_167*
dtype0
T
save/Identity_168Identitysave/RestoreV2:168*
T0*
_output_shapes
:
g
save/AssignVariableOp_168AssignVariableOpblock_11_expand_BN/gammasave/Identity_168*
dtype0
T
save/Identity_169Identitysave/RestoreV2:169*
_output_shapes
:*
T0
m
save/AssignVariableOp_169AssignVariableOpblock_11_expand_BN/moving_meansave/Identity_169*
dtype0
T
save/Identity_170Identitysave/RestoreV2:170*
T0*
_output_shapes
:
q
save/AssignVariableOp_170AssignVariableOp"block_11_expand_BN/moving_variancesave/Identity_170*
dtype0
T
save/Identity_171Identitysave/RestoreV2:171*
_output_shapes
:*
T0
r
save/AssignVariableOp_171AssignVariableOp#block_11_depthwise/depthwise_kernelsave/Identity_171*
dtype0
T
save/Identity_172Identitysave/RestoreV2:172*
T0*
_output_shapes
:
i
save/AssignVariableOp_172AssignVariableOpblock_11_depthwise_BN/betasave/Identity_172*
dtype0
T
save/Identity_173Identitysave/RestoreV2:173*
T0*
_output_shapes
:
j
save/AssignVariableOp_173AssignVariableOpblock_11_depthwise_BN/gammasave/Identity_173*
dtype0
T
save/Identity_174Identitysave/RestoreV2:174*
T0*
_output_shapes
:
p
save/AssignVariableOp_174AssignVariableOp!block_11_depthwise_BN/moving_meansave/Identity_174*
dtype0
T
save/Identity_175Identitysave/RestoreV2:175*
_output_shapes
:*
T0
t
save/AssignVariableOp_175AssignVariableOp%block_11_depthwise_BN/moving_variancesave/Identity_175*
dtype0
T
save/Identity_176Identitysave/RestoreV2:176*
T0*
_output_shapes
:
e
save/AssignVariableOp_176AssignVariableOpblock_1_expand_BN/betasave/Identity_176*
dtype0
T
save/Identity_177Identitysave/RestoreV2:177*
T0*
_output_shapes
:
f
save/AssignVariableOp_177AssignVariableOpblock_1_expand_BN/gammasave/Identity_177*
dtype0
T
save/Identity_178Identitysave/RestoreV2:178*
_output_shapes
:*
T0
l
save/AssignVariableOp_178AssignVariableOpblock_1_expand_BN/moving_meansave/Identity_178*
dtype0
T
save/Identity_179Identitysave/RestoreV2:179*
T0*
_output_shapes
:
p
save/AssignVariableOp_179AssignVariableOp!block_1_expand_BN/moving_variancesave/Identity_179*
dtype0
T
save/Identity_180Identitysave/RestoreV2:180*
T0*
_output_shapes
:
f
save/AssignVariableOp_180AssignVariableOpblock_11_project/kernelsave/Identity_180*
dtype0
T
save/Identity_181Identitysave/RestoreV2:181*
T0*
_output_shapes
:
g
save/AssignVariableOp_181AssignVariableOpblock_11_project_BN/betasave/Identity_181*
dtype0
T
save/Identity_182Identitysave/RestoreV2:182*
T0*
_output_shapes
:
h
save/AssignVariableOp_182AssignVariableOpblock_11_project_BN/gammasave/Identity_182*
dtype0
T
save/Identity_183Identitysave/RestoreV2:183*
T0*
_output_shapes
:
n
save/AssignVariableOp_183AssignVariableOpblock_11_project_BN/moving_meansave/Identity_183*
dtype0
T
save/Identity_184Identitysave/RestoreV2:184*
T0*
_output_shapes
:
r
save/AssignVariableOp_184AssignVariableOp#block_11_project_BN/moving_variancesave/Identity_184*
dtype0
T
save/Identity_185Identitysave/RestoreV2:185*
T0*
_output_shapes
:
e
save/AssignVariableOp_185AssignVariableOpblock_12_expand/kernelsave/Identity_185*
dtype0
T
save/Identity_186Identitysave/RestoreV2:186*
_output_shapes
:*
T0
f
save/AssignVariableOp_186AssignVariableOpblock_12_expand_BN/betasave/Identity_186*
dtype0
T
save/Identity_187Identitysave/RestoreV2:187*
T0*
_output_shapes
:
g
save/AssignVariableOp_187AssignVariableOpblock_12_expand_BN/gammasave/Identity_187*
dtype0
T
save/Identity_188Identitysave/RestoreV2:188*
T0*
_output_shapes
:
m
save/AssignVariableOp_188AssignVariableOpblock_12_expand_BN/moving_meansave/Identity_188*
dtype0
T
save/Identity_189Identitysave/RestoreV2:189*
T0*
_output_shapes
:
q
save/AssignVariableOp_189AssignVariableOp"block_12_expand_BN/moving_variancesave/Identity_189*
dtype0
T
save/Identity_190Identitysave/RestoreV2:190*
T0*
_output_shapes
:
r
save/AssignVariableOp_190AssignVariableOp#block_12_depthwise/depthwise_kernelsave/Identity_190*
dtype0
T
save/Identity_191Identitysave/RestoreV2:191*
T0*
_output_shapes
:
i
save/AssignVariableOp_191AssignVariableOpblock_12_depthwise_BN/betasave/Identity_191*
dtype0
T
save/Identity_192Identitysave/RestoreV2:192*
T0*
_output_shapes
:
j
save/AssignVariableOp_192AssignVariableOpblock_12_depthwise_BN/gammasave/Identity_192*
dtype0
T
save/Identity_193Identitysave/RestoreV2:193*
T0*
_output_shapes
:
p
save/AssignVariableOp_193AssignVariableOp!block_12_depthwise_BN/moving_meansave/Identity_193*
dtype0
T
save/Identity_194Identitysave/RestoreV2:194*
_output_shapes
:*
T0
t
save/AssignVariableOp_194AssignVariableOp%block_12_depthwise_BN/moving_variancesave/Identity_194*
dtype0
T
save/Identity_195Identitysave/RestoreV2:195*
T0*
_output_shapes
:
f
save/AssignVariableOp_195AssignVariableOpblock_12_project/kernelsave/Identity_195*
dtype0
T
save/Identity_196Identitysave/RestoreV2:196*
T0*
_output_shapes
:
g
save/AssignVariableOp_196AssignVariableOpblock_12_project_BN/betasave/Identity_196*
dtype0
T
save/Identity_197Identitysave/RestoreV2:197*
T0*
_output_shapes
:
h
save/AssignVariableOp_197AssignVariableOpblock_12_project_BN/gammasave/Identity_197*
dtype0
T
save/Identity_198Identitysave/RestoreV2:198*
T0*
_output_shapes
:
n
save/AssignVariableOp_198AssignVariableOpblock_12_project_BN/moving_meansave/Identity_198*
dtype0
T
save/Identity_199Identitysave/RestoreV2:199*
T0*
_output_shapes
:
r
save/AssignVariableOp_199AssignVariableOp#block_12_project_BN/moving_variancesave/Identity_199*
dtype0
T
save/Identity_200Identitysave/RestoreV2:200*
T0*
_output_shapes
:
e
save/AssignVariableOp_200AssignVariableOpblock_13_expand/kernelsave/Identity_200*
dtype0
T
save/Identity_201Identitysave/RestoreV2:201*
_output_shapes
:*
T0
f
save/AssignVariableOp_201AssignVariableOpblock_13_expand_BN/betasave/Identity_201*
dtype0
T
save/Identity_202Identitysave/RestoreV2:202*
_output_shapes
:*
T0
g
save/AssignVariableOp_202AssignVariableOpblock_13_expand_BN/gammasave/Identity_202*
dtype0
T
save/Identity_203Identitysave/RestoreV2:203*
_output_shapes
:*
T0
m
save/AssignVariableOp_203AssignVariableOpblock_13_expand_BN/moving_meansave/Identity_203*
dtype0
T
save/Identity_204Identitysave/RestoreV2:204*
_output_shapes
:*
T0
q
save/AssignVariableOp_204AssignVariableOp"block_13_expand_BN/moving_variancesave/Identity_204*
dtype0
T
save/Identity_205Identitysave/RestoreV2:205*
T0*
_output_shapes
:
q
save/AssignVariableOp_205AssignVariableOp"block_1_depthwise/depthwise_kernelsave/Identity_205*
dtype0
T
save/Identity_206Identitysave/RestoreV2:206*
T0*
_output_shapes
:
r
save/AssignVariableOp_206AssignVariableOp#block_13_depthwise/depthwise_kernelsave/Identity_206*
dtype0
T
save/Identity_207Identitysave/RestoreV2:207*
T0*
_output_shapes
:
i
save/AssignVariableOp_207AssignVariableOpblock_13_depthwise_BN/betasave/Identity_207*
dtype0
T
save/Identity_208Identitysave/RestoreV2:208*
T0*
_output_shapes
:
j
save/AssignVariableOp_208AssignVariableOpblock_13_depthwise_BN/gammasave/Identity_208*
dtype0
T
save/Identity_209Identitysave/RestoreV2:209*
_output_shapes
:*
T0
p
save/AssignVariableOp_209AssignVariableOp!block_13_depthwise_BN/moving_meansave/Identity_209*
dtype0
T
save/Identity_210Identitysave/RestoreV2:210*
T0*
_output_shapes
:
t
save/AssignVariableOp_210AssignVariableOp%block_13_depthwise_BN/moving_variancesave/Identity_210*
dtype0
T
save/Identity_211Identitysave/RestoreV2:211*
T0*
_output_shapes
:
f
save/AssignVariableOp_211AssignVariableOpblock_13_project/kernelsave/Identity_211*
dtype0
T
save/Identity_212Identitysave/RestoreV2:212*
T0*
_output_shapes
:
g
save/AssignVariableOp_212AssignVariableOpblock_13_project_BN/betasave/Identity_212*
dtype0
T
save/Identity_213Identitysave/RestoreV2:213*
_output_shapes
:*
T0
h
save/AssignVariableOp_213AssignVariableOpblock_13_project_BN/gammasave/Identity_213*
dtype0
T
save/Identity_214Identitysave/RestoreV2:214*
_output_shapes
:*
T0
n
save/AssignVariableOp_214AssignVariableOpblock_13_project_BN/moving_meansave/Identity_214*
dtype0
T
save/Identity_215Identitysave/RestoreV2:215*
_output_shapes
:*
T0
r
save/AssignVariableOp_215AssignVariableOp#block_13_project_BN/moving_variancesave/Identity_215*
dtype0
T
save/Identity_216Identitysave/RestoreV2:216*
_output_shapes
:*
T0
e
save/AssignVariableOp_216AssignVariableOpblock_14_expand/kernelsave/Identity_216*
dtype0
T
save/Identity_217Identitysave/RestoreV2:217*
T0*
_output_shapes
:
f
save/AssignVariableOp_217AssignVariableOpblock_14_expand_BN/betasave/Identity_217*
dtype0
T
save/Identity_218Identitysave/RestoreV2:218*
_output_shapes
:*
T0
g
save/AssignVariableOp_218AssignVariableOpblock_14_expand_BN/gammasave/Identity_218*
dtype0
T
save/Identity_219Identitysave/RestoreV2:219*
T0*
_output_shapes
:
m
save/AssignVariableOp_219AssignVariableOpblock_14_expand_BN/moving_meansave/Identity_219*
dtype0
T
save/Identity_220Identitysave/RestoreV2:220*
T0*
_output_shapes
:
q
save/AssignVariableOp_220AssignVariableOp"block_14_expand_BN/moving_variancesave/Identity_220*
dtype0
T
save/Identity_221Identitysave/RestoreV2:221*
T0*
_output_shapes
:
r
save/AssignVariableOp_221AssignVariableOp#block_14_depthwise/depthwise_kernelsave/Identity_221*
dtype0
T
save/Identity_222Identitysave/RestoreV2:222*
T0*
_output_shapes
:
i
save/AssignVariableOp_222AssignVariableOpblock_14_depthwise_BN/betasave/Identity_222*
dtype0
T
save/Identity_223Identitysave/RestoreV2:223*
T0*
_output_shapes
:
j
save/AssignVariableOp_223AssignVariableOpblock_14_depthwise_BN/gammasave/Identity_223*
dtype0
T
save/Identity_224Identitysave/RestoreV2:224*
_output_shapes
:*
T0
p
save/AssignVariableOp_224AssignVariableOp!block_14_depthwise_BN/moving_meansave/Identity_224*
dtype0
T
save/Identity_225Identitysave/RestoreV2:225*
T0*
_output_shapes
:
t
save/AssignVariableOp_225AssignVariableOp%block_14_depthwise_BN/moving_variancesave/Identity_225*
dtype0
T
save/Identity_226Identitysave/RestoreV2:226*
T0*
_output_shapes
:
f
save/AssignVariableOp_226AssignVariableOpblock_14_project/kernelsave/Identity_226*
dtype0
T
save/Identity_227Identitysave/RestoreV2:227*
T0*
_output_shapes
:
g
save/AssignVariableOp_227AssignVariableOpblock_14_project_BN/betasave/Identity_227*
dtype0
T
save/Identity_228Identitysave/RestoreV2:228*
T0*
_output_shapes
:
h
save/AssignVariableOp_228AssignVariableOpblock_14_project_BN/gammasave/Identity_228*
dtype0
T
save/Identity_229Identitysave/RestoreV2:229*
T0*
_output_shapes
:
n
save/AssignVariableOp_229AssignVariableOpblock_14_project_BN/moving_meansave/Identity_229*
dtype0
T
save/Identity_230Identitysave/RestoreV2:230*
T0*
_output_shapes
:
r
save/AssignVariableOp_230AssignVariableOp#block_14_project_BN/moving_variancesave/Identity_230*
dtype0
T
save/Identity_231Identitysave/RestoreV2:231*
T0*
_output_shapes
:
h
save/AssignVariableOp_231AssignVariableOpblock_1_depthwise_BN/betasave/Identity_231*
dtype0
T
save/Identity_232Identitysave/RestoreV2:232*
_output_shapes
:*
T0
i
save/AssignVariableOp_232AssignVariableOpblock_1_depthwise_BN/gammasave/Identity_232*
dtype0
T
save/Identity_233Identitysave/RestoreV2:233*
_output_shapes
:*
T0
o
save/AssignVariableOp_233AssignVariableOp block_1_depthwise_BN/moving_meansave/Identity_233*
dtype0
T
save/Identity_234Identitysave/RestoreV2:234*
T0*
_output_shapes
:
s
save/AssignVariableOp_234AssignVariableOp$block_1_depthwise_BN/moving_variancesave/Identity_234*
dtype0
T
save/Identity_235Identitysave/RestoreV2:235*
_output_shapes
:*
T0
e
save/AssignVariableOp_235AssignVariableOpblock_15_expand/kernelsave/Identity_235*
dtype0
T
save/Identity_236Identitysave/RestoreV2:236*
_output_shapes
:*
T0
f
save/AssignVariableOp_236AssignVariableOpblock_15_expand_BN/betasave/Identity_236*
dtype0
T
save/Identity_237Identitysave/RestoreV2:237*
_output_shapes
:*
T0
g
save/AssignVariableOp_237AssignVariableOpblock_15_expand_BN/gammasave/Identity_237*
dtype0
T
save/Identity_238Identitysave/RestoreV2:238*
T0*
_output_shapes
:
m
save/AssignVariableOp_238AssignVariableOpblock_15_expand_BN/moving_meansave/Identity_238*
dtype0
T
save/Identity_239Identitysave/RestoreV2:239*
T0*
_output_shapes
:
q
save/AssignVariableOp_239AssignVariableOp"block_15_expand_BN/moving_variancesave/Identity_239*
dtype0
T
save/Identity_240Identitysave/RestoreV2:240*
T0*
_output_shapes
:
r
save/AssignVariableOp_240AssignVariableOp#block_15_depthwise/depthwise_kernelsave/Identity_240*
dtype0
T
save/Identity_241Identitysave/RestoreV2:241*
T0*
_output_shapes
:
i
save/AssignVariableOp_241AssignVariableOpblock_15_depthwise_BN/betasave/Identity_241*
dtype0
T
save/Identity_242Identitysave/RestoreV2:242*
T0*
_output_shapes
:
j
save/AssignVariableOp_242AssignVariableOpblock_15_depthwise_BN/gammasave/Identity_242*
dtype0
T
save/Identity_243Identitysave/RestoreV2:243*
T0*
_output_shapes
:
p
save/AssignVariableOp_243AssignVariableOp!block_15_depthwise_BN/moving_meansave/Identity_243*
dtype0
T
save/Identity_244Identitysave/RestoreV2:244*
T0*
_output_shapes
:
t
save/AssignVariableOp_244AssignVariableOp%block_15_depthwise_BN/moving_variancesave/Identity_244*
dtype0
T
save/Identity_245Identitysave/RestoreV2:245*
_output_shapes
:*
T0
f
save/AssignVariableOp_245AssignVariableOpblock_15_project/kernelsave/Identity_245*
dtype0
T
save/Identity_246Identitysave/RestoreV2:246*
T0*
_output_shapes
:
g
save/AssignVariableOp_246AssignVariableOpblock_15_project_BN/betasave/Identity_246*
dtype0
T
save/Identity_247Identitysave/RestoreV2:247*
_output_shapes
:*
T0
h
save/AssignVariableOp_247AssignVariableOpblock_15_project_BN/gammasave/Identity_247*
dtype0
T
save/Identity_248Identitysave/RestoreV2:248*
T0*
_output_shapes
:
n
save/AssignVariableOp_248AssignVariableOpblock_15_project_BN/moving_meansave/Identity_248*
dtype0
T
save/Identity_249Identitysave/RestoreV2:249*
_output_shapes
:*
T0
r
save/AssignVariableOp_249AssignVariableOp#block_15_project_BN/moving_variancesave/Identity_249*
dtype0
T
save/Identity_250Identitysave/RestoreV2:250*
_output_shapes
:*
T0
e
save/AssignVariableOp_250AssignVariableOpblock_16_expand/kernelsave/Identity_250*
dtype0
T
save/Identity_251Identitysave/RestoreV2:251*
T0*
_output_shapes
:
f
save/AssignVariableOp_251AssignVariableOpblock_16_expand_BN/betasave/Identity_251*
dtype0
T
save/Identity_252Identitysave/RestoreV2:252*
_output_shapes
:*
T0
g
save/AssignVariableOp_252AssignVariableOpblock_16_expand_BN/gammasave/Identity_252*
dtype0
T
save/Identity_253Identitysave/RestoreV2:253*
_output_shapes
:*
T0
m
save/AssignVariableOp_253AssignVariableOpblock_16_expand_BN/moving_meansave/Identity_253*
dtype0
T
save/Identity_254Identitysave/RestoreV2:254*
T0*
_output_shapes
:
q
save/AssignVariableOp_254AssignVariableOp"block_16_expand_BN/moving_variancesave/Identity_254*
dtype0
T
save/Identity_255Identitysave/RestoreV2:255*
T0*
_output_shapes
:
r
save/AssignVariableOp_255AssignVariableOp#block_16_depthwise/depthwise_kernelsave/Identity_255*
dtype0
T
save/Identity_256Identitysave/RestoreV2:256*
_output_shapes
:*
T0
i
save/AssignVariableOp_256AssignVariableOpblock_16_depthwise_BN/betasave/Identity_256*
dtype0
T
save/Identity_257Identitysave/RestoreV2:257*
T0*
_output_shapes
:
j
save/AssignVariableOp_257AssignVariableOpblock_16_depthwise_BN/gammasave/Identity_257*
dtype0
T
save/Identity_258Identitysave/RestoreV2:258*
T0*
_output_shapes
:
p
save/AssignVariableOp_258AssignVariableOp!block_16_depthwise_BN/moving_meansave/Identity_258*
dtype0
T
save/Identity_259Identitysave/RestoreV2:259*
T0*
_output_shapes
:
t
save/AssignVariableOp_259AssignVariableOp%block_16_depthwise_BN/moving_variancesave/Identity_259*
dtype0
T
save/Identity_260Identitysave/RestoreV2:260*
_output_shapes
:*
T0
`
save/AssignVariableOp_260AssignVariableOpdense_Dense1/biassave/Identity_260*
dtype0
T
save/Identity_261Identitysave/RestoreV2:261*
_output_shapes
:*
T0
b
save/AssignVariableOp_261AssignVariableOpdense_Dense1/kernelsave/Identity_261*
dtype0
T
save/Identity_262Identitysave/RestoreV2:262*
_output_shapes
:*
T0
b
save/AssignVariableOp_262AssignVariableOpdense_Dense2/kernelsave/Identity_262*
dtype0
?8
save/restore_allNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_100^save/AssignVariableOp_101^save/AssignVariableOp_102^save/AssignVariableOp_103^save/AssignVariableOp_104^save/AssignVariableOp_105^save/AssignVariableOp_106^save/AssignVariableOp_107^save/AssignVariableOp_108^save/AssignVariableOp_109^save/AssignVariableOp_11^save/AssignVariableOp_110^save/AssignVariableOp_111^save/AssignVariableOp_112^save/AssignVariableOp_113^save/AssignVariableOp_114^save/AssignVariableOp_115^save/AssignVariableOp_116^save/AssignVariableOp_117^save/AssignVariableOp_118^save/AssignVariableOp_119^save/AssignVariableOp_12^save/AssignVariableOp_120^save/AssignVariableOp_121^save/AssignVariableOp_122^save/AssignVariableOp_123^save/AssignVariableOp_124^save/AssignVariableOp_125^save/AssignVariableOp_126^save/AssignVariableOp_127^save/AssignVariableOp_128^save/AssignVariableOp_129^save/AssignVariableOp_13^save/AssignVariableOp_130^save/AssignVariableOp_131^save/AssignVariableOp_132^save/AssignVariableOp_133^save/AssignVariableOp_134^save/AssignVariableOp_135^save/AssignVariableOp_136^save/AssignVariableOp_137^save/AssignVariableOp_138^save/AssignVariableOp_139^save/AssignVariableOp_14^save/AssignVariableOp_140^save/AssignVariableOp_141^save/AssignVariableOp_142^save/AssignVariableOp_143^save/AssignVariableOp_144^save/AssignVariableOp_145^save/AssignVariableOp_146^save/AssignVariableOp_147^save/AssignVariableOp_148^save/AssignVariableOp_149^save/AssignVariableOp_15^save/AssignVariableOp_150^save/AssignVariableOp_151^save/AssignVariableOp_152^save/AssignVariableOp_153^save/AssignVariableOp_154^save/AssignVariableOp_155^save/AssignVariableOp_156^save/AssignVariableOp_157^save/AssignVariableOp_158^save/AssignVariableOp_159^save/AssignVariableOp_16^save/AssignVariableOp_160^save/AssignVariableOp_161^save/AssignVariableOp_162^save/AssignVariableOp_163^save/AssignVariableOp_164^save/AssignVariableOp_165^save/AssignVariableOp_166^save/AssignVariableOp_167^save/AssignVariableOp_168^save/AssignVariableOp_169^save/AssignVariableOp_17^save/AssignVariableOp_170^save/AssignVariableOp_171^save/AssignVariableOp_172^save/AssignVariableOp_173^save/AssignVariableOp_174^save/AssignVariableOp_175^save/AssignVariableOp_176^save/AssignVariableOp_177^save/AssignVariableOp_178^save/AssignVariableOp_179^save/AssignVariableOp_18^save/AssignVariableOp_180^save/AssignVariableOp_181^save/AssignVariableOp_182^save/AssignVariableOp_183^save/AssignVariableOp_184^save/AssignVariableOp_185^save/AssignVariableOp_186^save/AssignVariableOp_187^save/AssignVariableOp_188^save/AssignVariableOp_189^save/AssignVariableOp_19^save/AssignVariableOp_190^save/AssignVariableOp_191^save/AssignVariableOp_192^save/AssignVariableOp_193^save/AssignVariableOp_194^save/AssignVariableOp_195^save/AssignVariableOp_196^save/AssignVariableOp_197^save/AssignVariableOp_198^save/AssignVariableOp_199^save/AssignVariableOp_2^save/AssignVariableOp_20^save/AssignVariableOp_200^save/AssignVariableOp_201^save/AssignVariableOp_202^save/AssignVariableOp_203^save/AssignVariableOp_204^save/AssignVariableOp_205^save/AssignVariableOp_206^save/AssignVariableOp_207^save/AssignVariableOp_208^save/AssignVariableOp_209^save/AssignVariableOp_21^save/AssignVariableOp_210^save/AssignVariableOp_211^save/AssignVariableOp_212^save/AssignVariableOp_213^save/AssignVariableOp_214^save/AssignVariableOp_215^save/AssignVariableOp_216^save/AssignVariableOp_217^save/AssignVariableOp_218^save/AssignVariableOp_219^save/AssignVariableOp_22^save/AssignVariableOp_220^save/AssignVariableOp_221^save/AssignVariableOp_222^save/AssignVariableOp_223^save/AssignVariableOp_224^save/AssignVariableOp_225^save/AssignVariableOp_226^save/AssignVariableOp_227^save/AssignVariableOp_228^save/AssignVariableOp_229^save/AssignVariableOp_23^save/AssignVariableOp_230^save/AssignVariableOp_231^save/AssignVariableOp_232^save/AssignVariableOp_233^save/AssignVariableOp_234^save/AssignVariableOp_235^save/AssignVariableOp_236^save/AssignVariableOp_237^save/AssignVariableOp_238^save/AssignVariableOp_239^save/AssignVariableOp_24^save/AssignVariableOp_240^save/AssignVariableOp_241^save/AssignVariableOp_242^save/AssignVariableOp_243^save/AssignVariableOp_244^save/AssignVariableOp_245^save/AssignVariableOp_246^save/AssignVariableOp_247^save/AssignVariableOp_248^save/AssignVariableOp_249^save/AssignVariableOp_25^save/AssignVariableOp_250^save/AssignVariableOp_251^save/AssignVariableOp_252^save/AssignVariableOp_253^save/AssignVariableOp_254^save/AssignVariableOp_255^save/AssignVariableOp_256^save/AssignVariableOp_257^save/AssignVariableOp_258^save/AssignVariableOp_259^save/AssignVariableOp_26^save/AssignVariableOp_260^save/AssignVariableOp_261^save/AssignVariableOp_262^save/AssignVariableOp_27^save/AssignVariableOp_28^save/AssignVariableOp_29^save/AssignVariableOp_3^save/AssignVariableOp_30^save/AssignVariableOp_31^save/AssignVariableOp_32^save/AssignVariableOp_33^save/AssignVariableOp_34^save/AssignVariableOp_35^save/AssignVariableOp_36^save/AssignVariableOp_37^save/AssignVariableOp_38^save/AssignVariableOp_39^save/AssignVariableOp_4^save/AssignVariableOp_40^save/AssignVariableOp_41^save/AssignVariableOp_42^save/AssignVariableOp_43^save/AssignVariableOp_44^save/AssignVariableOp_45^save/AssignVariableOp_46^save/AssignVariableOp_47^save/AssignVariableOp_48^save/AssignVariableOp_49^save/AssignVariableOp_5^save/AssignVariableOp_50^save/AssignVariableOp_51^save/AssignVariableOp_52^save/AssignVariableOp_53^save/AssignVariableOp_54^save/AssignVariableOp_55^save/AssignVariableOp_56^save/AssignVariableOp_57^save/AssignVariableOp_58^save/AssignVariableOp_59^save/AssignVariableOp_6^save/AssignVariableOp_60^save/AssignVariableOp_61^save/AssignVariableOp_62^save/AssignVariableOp_63^save/AssignVariableOp_64^save/AssignVariableOp_65^save/AssignVariableOp_66^save/AssignVariableOp_67^save/AssignVariableOp_68^save/AssignVariableOp_69^save/AssignVariableOp_7^save/AssignVariableOp_70^save/AssignVariableOp_71^save/AssignVariableOp_72^save/AssignVariableOp_73^save/AssignVariableOp_74^save/AssignVariableOp_75^save/AssignVariableOp_76^save/AssignVariableOp_77^save/AssignVariableOp_78^save/AssignVariableOp_79^save/AssignVariableOp_8^save/AssignVariableOp_80^save/AssignVariableOp_81^save/AssignVariableOp_82^save/AssignVariableOp_83^save/AssignVariableOp_84^save/AssignVariableOp_85^save/AssignVariableOp_86^save/AssignVariableOp_87^save/AssignVariableOp_88^save/AssignVariableOp_89^save/AssignVariableOp_9^save/AssignVariableOp_90^save/AssignVariableOp_91^save/AssignVariableOp_92^save/AssignVariableOp_93^save/AssignVariableOp_94^save/AssignVariableOp_95^save/AssignVariableOp_96^save/AssignVariableOp_97^save/AssignVariableOp_98^save/AssignVariableOp_99

init_1NoOp"?D
save/Const:0save/control_dependency:0save/restore_all 5 @F8"??
trainable_variables????
x
Conv1/kernel:0Conv1/kernel/Assign"Conv1/kernel/Read/ReadVariableOp:0(2)Conv1/kernel/Initializer/random_uniform:08
v
bn_Conv1/gamma:0bn_Conv1/gamma/Assign$bn_Conv1/gamma/Read/ReadVariableOp:0(2!bn_Conv1/gamma/Initializer/ones:08
s
bn_Conv1/beta:0bn_Conv1/beta/Assign#bn_Conv1/beta/Read/ReadVariableOp:0(2!bn_Conv1/beta/Initializer/zeros:08
?
*expanded_conv_depthwise/depthwise_kernel:0/expanded_conv_depthwise/depthwise_kernel/Assign>expanded_conv_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2Eexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
"expanded_conv_depthwise_BN/gamma:0'expanded_conv_depthwise_BN/gamma/Assign6expanded_conv_depthwise_BN/gamma/Read/ReadVariableOp:0(23expanded_conv_depthwise_BN/gamma/Initializer/ones:08
?
!expanded_conv_depthwise_BN/beta:0&expanded_conv_depthwise_BN/beta/Assign5expanded_conv_depthwise_BN/beta/Read/ReadVariableOp:0(23expanded_conv_depthwise_BN/beta/Initializer/zeros:08
?
expanded_conv_project/kernel:0#expanded_conv_project/kernel/Assign2expanded_conv_project/kernel/Read/ReadVariableOp:0(29expanded_conv_project/kernel/Initializer/random_uniform:08
?
 expanded_conv_project_BN/gamma:0%expanded_conv_project_BN/gamma/Assign4expanded_conv_project_BN/gamma/Read/ReadVariableOp:0(21expanded_conv_project_BN/gamma/Initializer/ones:08
?
expanded_conv_project_BN/beta:0$expanded_conv_project_BN/beta/Assign3expanded_conv_project_BN/beta/Read/ReadVariableOp:0(21expanded_conv_project_BN/beta/Initializer/zeros:08
?
block_1_expand/kernel:0block_1_expand/kernel/Assign+block_1_expand/kernel/Read/ReadVariableOp:0(22block_1_expand/kernel/Initializer/random_uniform:08
?
block_1_expand_BN/gamma:0block_1_expand_BN/gamma/Assign-block_1_expand_BN/gamma/Read/ReadVariableOp:0(2*block_1_expand_BN/gamma/Initializer/ones:08
?
block_1_expand_BN/beta:0block_1_expand_BN/beta/Assign,block_1_expand_BN/beta/Read/ReadVariableOp:0(2*block_1_expand_BN/beta/Initializer/zeros:08
?
$block_1_depthwise/depthwise_kernel:0)block_1_depthwise/depthwise_kernel/Assign8block_1_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_1_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_1_depthwise_BN/gamma:0!block_1_depthwise_BN/gamma/Assign0block_1_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_1_depthwise_BN/gamma/Initializer/ones:08
?
block_1_depthwise_BN/beta:0 block_1_depthwise_BN/beta/Assign/block_1_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_1_depthwise_BN/beta/Initializer/zeros:08
?
block_1_project/kernel:0block_1_project/kernel/Assign,block_1_project/kernel/Read/ReadVariableOp:0(23block_1_project/kernel/Initializer/random_uniform:08
?
block_1_project_BN/gamma:0block_1_project_BN/gamma/Assign.block_1_project_BN/gamma/Read/ReadVariableOp:0(2+block_1_project_BN/gamma/Initializer/ones:08
?
block_1_project_BN/beta:0block_1_project_BN/beta/Assign-block_1_project_BN/beta/Read/ReadVariableOp:0(2+block_1_project_BN/beta/Initializer/zeros:08
?
block_2_expand/kernel:0block_2_expand/kernel/Assign+block_2_expand/kernel/Read/ReadVariableOp:0(22block_2_expand/kernel/Initializer/random_uniform:08
?
block_2_expand_BN/gamma:0block_2_expand_BN/gamma/Assign-block_2_expand_BN/gamma/Read/ReadVariableOp:0(2*block_2_expand_BN/gamma/Initializer/ones:08
?
block_2_expand_BN/beta:0block_2_expand_BN/beta/Assign,block_2_expand_BN/beta/Read/ReadVariableOp:0(2*block_2_expand_BN/beta/Initializer/zeros:08
?
$block_2_depthwise/depthwise_kernel:0)block_2_depthwise/depthwise_kernel/Assign8block_2_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_2_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_2_depthwise_BN/gamma:0!block_2_depthwise_BN/gamma/Assign0block_2_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_2_depthwise_BN/gamma/Initializer/ones:08
?
block_2_depthwise_BN/beta:0 block_2_depthwise_BN/beta/Assign/block_2_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_2_depthwise_BN/beta/Initializer/zeros:08
?
block_2_project/kernel:0block_2_project/kernel/Assign,block_2_project/kernel/Read/ReadVariableOp:0(23block_2_project/kernel/Initializer/random_uniform:08
?
block_2_project_BN/gamma:0block_2_project_BN/gamma/Assign.block_2_project_BN/gamma/Read/ReadVariableOp:0(2+block_2_project_BN/gamma/Initializer/ones:08
?
block_2_project_BN/beta:0block_2_project_BN/beta/Assign-block_2_project_BN/beta/Read/ReadVariableOp:0(2+block_2_project_BN/beta/Initializer/zeros:08
?
block_3_expand/kernel:0block_3_expand/kernel/Assign+block_3_expand/kernel/Read/ReadVariableOp:0(22block_3_expand/kernel/Initializer/random_uniform:08
?
block_3_expand_BN/gamma:0block_3_expand_BN/gamma/Assign-block_3_expand_BN/gamma/Read/ReadVariableOp:0(2*block_3_expand_BN/gamma/Initializer/ones:08
?
block_3_expand_BN/beta:0block_3_expand_BN/beta/Assign,block_3_expand_BN/beta/Read/ReadVariableOp:0(2*block_3_expand_BN/beta/Initializer/zeros:08
?
$block_3_depthwise/depthwise_kernel:0)block_3_depthwise/depthwise_kernel/Assign8block_3_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_3_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_3_depthwise_BN/gamma:0!block_3_depthwise_BN/gamma/Assign0block_3_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_3_depthwise_BN/gamma/Initializer/ones:08
?
block_3_depthwise_BN/beta:0 block_3_depthwise_BN/beta/Assign/block_3_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_3_depthwise_BN/beta/Initializer/zeros:08
?
block_3_project/kernel:0block_3_project/kernel/Assign,block_3_project/kernel/Read/ReadVariableOp:0(23block_3_project/kernel/Initializer/random_uniform:08
?
block_3_project_BN/gamma:0block_3_project_BN/gamma/Assign.block_3_project_BN/gamma/Read/ReadVariableOp:0(2+block_3_project_BN/gamma/Initializer/ones:08
?
block_3_project_BN/beta:0block_3_project_BN/beta/Assign-block_3_project_BN/beta/Read/ReadVariableOp:0(2+block_3_project_BN/beta/Initializer/zeros:08
?
block_4_expand/kernel:0block_4_expand/kernel/Assign+block_4_expand/kernel/Read/ReadVariableOp:0(22block_4_expand/kernel/Initializer/random_uniform:08
?
block_4_expand_BN/gamma:0block_4_expand_BN/gamma/Assign-block_4_expand_BN/gamma/Read/ReadVariableOp:0(2*block_4_expand_BN/gamma/Initializer/ones:08
?
block_4_expand_BN/beta:0block_4_expand_BN/beta/Assign,block_4_expand_BN/beta/Read/ReadVariableOp:0(2*block_4_expand_BN/beta/Initializer/zeros:08
?
$block_4_depthwise/depthwise_kernel:0)block_4_depthwise/depthwise_kernel/Assign8block_4_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_4_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_4_depthwise_BN/gamma:0!block_4_depthwise_BN/gamma/Assign0block_4_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_4_depthwise_BN/gamma/Initializer/ones:08
?
block_4_depthwise_BN/beta:0 block_4_depthwise_BN/beta/Assign/block_4_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_4_depthwise_BN/beta/Initializer/zeros:08
?
block_4_project/kernel:0block_4_project/kernel/Assign,block_4_project/kernel/Read/ReadVariableOp:0(23block_4_project/kernel/Initializer/random_uniform:08
?
block_4_project_BN/gamma:0block_4_project_BN/gamma/Assign.block_4_project_BN/gamma/Read/ReadVariableOp:0(2+block_4_project_BN/gamma/Initializer/ones:08
?
block_4_project_BN/beta:0block_4_project_BN/beta/Assign-block_4_project_BN/beta/Read/ReadVariableOp:0(2+block_4_project_BN/beta/Initializer/zeros:08
?
block_5_expand/kernel:0block_5_expand/kernel/Assign+block_5_expand/kernel/Read/ReadVariableOp:0(22block_5_expand/kernel/Initializer/random_uniform:08
?
block_5_expand_BN/gamma:0block_5_expand_BN/gamma/Assign-block_5_expand_BN/gamma/Read/ReadVariableOp:0(2*block_5_expand_BN/gamma/Initializer/ones:08
?
block_5_expand_BN/beta:0block_5_expand_BN/beta/Assign,block_5_expand_BN/beta/Read/ReadVariableOp:0(2*block_5_expand_BN/beta/Initializer/zeros:08
?
$block_5_depthwise/depthwise_kernel:0)block_5_depthwise/depthwise_kernel/Assign8block_5_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_5_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_5_depthwise_BN/gamma:0!block_5_depthwise_BN/gamma/Assign0block_5_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_5_depthwise_BN/gamma/Initializer/ones:08
?
block_5_depthwise_BN/beta:0 block_5_depthwise_BN/beta/Assign/block_5_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_5_depthwise_BN/beta/Initializer/zeros:08
?
block_5_project/kernel:0block_5_project/kernel/Assign,block_5_project/kernel/Read/ReadVariableOp:0(23block_5_project/kernel/Initializer/random_uniform:08
?
block_5_project_BN/gamma:0block_5_project_BN/gamma/Assign.block_5_project_BN/gamma/Read/ReadVariableOp:0(2+block_5_project_BN/gamma/Initializer/ones:08
?
block_5_project_BN/beta:0block_5_project_BN/beta/Assign-block_5_project_BN/beta/Read/ReadVariableOp:0(2+block_5_project_BN/beta/Initializer/zeros:08
?
block_6_expand/kernel:0block_6_expand/kernel/Assign+block_6_expand/kernel/Read/ReadVariableOp:0(22block_6_expand/kernel/Initializer/random_uniform:08
?
block_6_expand_BN/gamma:0block_6_expand_BN/gamma/Assign-block_6_expand_BN/gamma/Read/ReadVariableOp:0(2*block_6_expand_BN/gamma/Initializer/ones:08
?
block_6_expand_BN/beta:0block_6_expand_BN/beta/Assign,block_6_expand_BN/beta/Read/ReadVariableOp:0(2*block_6_expand_BN/beta/Initializer/zeros:08
?
$block_6_depthwise/depthwise_kernel:0)block_6_depthwise/depthwise_kernel/Assign8block_6_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_6_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_6_depthwise_BN/gamma:0!block_6_depthwise_BN/gamma/Assign0block_6_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_6_depthwise_BN/gamma/Initializer/ones:08
?
block_6_depthwise_BN/beta:0 block_6_depthwise_BN/beta/Assign/block_6_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_6_depthwise_BN/beta/Initializer/zeros:08
?
block_6_project/kernel:0block_6_project/kernel/Assign,block_6_project/kernel/Read/ReadVariableOp:0(23block_6_project/kernel/Initializer/random_uniform:08
?
block_6_project_BN/gamma:0block_6_project_BN/gamma/Assign.block_6_project_BN/gamma/Read/ReadVariableOp:0(2+block_6_project_BN/gamma/Initializer/ones:08
?
block_6_project_BN/beta:0block_6_project_BN/beta/Assign-block_6_project_BN/beta/Read/ReadVariableOp:0(2+block_6_project_BN/beta/Initializer/zeros:08
?
block_7_expand/kernel:0block_7_expand/kernel/Assign+block_7_expand/kernel/Read/ReadVariableOp:0(22block_7_expand/kernel/Initializer/random_uniform:08
?
block_7_expand_BN/gamma:0block_7_expand_BN/gamma/Assign-block_7_expand_BN/gamma/Read/ReadVariableOp:0(2*block_7_expand_BN/gamma/Initializer/ones:08
?
block_7_expand_BN/beta:0block_7_expand_BN/beta/Assign,block_7_expand_BN/beta/Read/ReadVariableOp:0(2*block_7_expand_BN/beta/Initializer/zeros:08
?
$block_7_depthwise/depthwise_kernel:0)block_7_depthwise/depthwise_kernel/Assign8block_7_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_7_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_7_depthwise_BN/gamma:0!block_7_depthwise_BN/gamma/Assign0block_7_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_7_depthwise_BN/gamma/Initializer/ones:08
?
block_7_depthwise_BN/beta:0 block_7_depthwise_BN/beta/Assign/block_7_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_7_depthwise_BN/beta/Initializer/zeros:08
?
block_7_project/kernel:0block_7_project/kernel/Assign,block_7_project/kernel/Read/ReadVariableOp:0(23block_7_project/kernel/Initializer/random_uniform:08
?
block_7_project_BN/gamma:0block_7_project_BN/gamma/Assign.block_7_project_BN/gamma/Read/ReadVariableOp:0(2+block_7_project_BN/gamma/Initializer/ones:08
?
block_7_project_BN/beta:0block_7_project_BN/beta/Assign-block_7_project_BN/beta/Read/ReadVariableOp:0(2+block_7_project_BN/beta/Initializer/zeros:08
?
block_8_expand/kernel:0block_8_expand/kernel/Assign+block_8_expand/kernel/Read/ReadVariableOp:0(22block_8_expand/kernel/Initializer/random_uniform:08
?
block_8_expand_BN/gamma:0block_8_expand_BN/gamma/Assign-block_8_expand_BN/gamma/Read/ReadVariableOp:0(2*block_8_expand_BN/gamma/Initializer/ones:08
?
block_8_expand_BN/beta:0block_8_expand_BN/beta/Assign,block_8_expand_BN/beta/Read/ReadVariableOp:0(2*block_8_expand_BN/beta/Initializer/zeros:08
?
$block_8_depthwise/depthwise_kernel:0)block_8_depthwise/depthwise_kernel/Assign8block_8_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_8_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_8_depthwise_BN/gamma:0!block_8_depthwise_BN/gamma/Assign0block_8_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_8_depthwise_BN/gamma/Initializer/ones:08
?
block_8_depthwise_BN/beta:0 block_8_depthwise_BN/beta/Assign/block_8_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_8_depthwise_BN/beta/Initializer/zeros:08
?
block_8_project/kernel:0block_8_project/kernel/Assign,block_8_project/kernel/Read/ReadVariableOp:0(23block_8_project/kernel/Initializer/random_uniform:08
?
block_8_project_BN/gamma:0block_8_project_BN/gamma/Assign.block_8_project_BN/gamma/Read/ReadVariableOp:0(2+block_8_project_BN/gamma/Initializer/ones:08
?
block_8_project_BN/beta:0block_8_project_BN/beta/Assign-block_8_project_BN/beta/Read/ReadVariableOp:0(2+block_8_project_BN/beta/Initializer/zeros:08
?
block_9_expand/kernel:0block_9_expand/kernel/Assign+block_9_expand/kernel/Read/ReadVariableOp:0(22block_9_expand/kernel/Initializer/random_uniform:08
?
block_9_expand_BN/gamma:0block_9_expand_BN/gamma/Assign-block_9_expand_BN/gamma/Read/ReadVariableOp:0(2*block_9_expand_BN/gamma/Initializer/ones:08
?
block_9_expand_BN/beta:0block_9_expand_BN/beta/Assign,block_9_expand_BN/beta/Read/ReadVariableOp:0(2*block_9_expand_BN/beta/Initializer/zeros:08
?
$block_9_depthwise/depthwise_kernel:0)block_9_depthwise/depthwise_kernel/Assign8block_9_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_9_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_9_depthwise_BN/gamma:0!block_9_depthwise_BN/gamma/Assign0block_9_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_9_depthwise_BN/gamma/Initializer/ones:08
?
block_9_depthwise_BN/beta:0 block_9_depthwise_BN/beta/Assign/block_9_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_9_depthwise_BN/beta/Initializer/zeros:08
?
block_9_project/kernel:0block_9_project/kernel/Assign,block_9_project/kernel/Read/ReadVariableOp:0(23block_9_project/kernel/Initializer/random_uniform:08
?
block_9_project_BN/gamma:0block_9_project_BN/gamma/Assign.block_9_project_BN/gamma/Read/ReadVariableOp:0(2+block_9_project_BN/gamma/Initializer/ones:08
?
block_9_project_BN/beta:0block_9_project_BN/beta/Assign-block_9_project_BN/beta/Read/ReadVariableOp:0(2+block_9_project_BN/beta/Initializer/zeros:08
?
block_10_expand/kernel:0block_10_expand/kernel/Assign,block_10_expand/kernel/Read/ReadVariableOp:0(23block_10_expand/kernel/Initializer/random_uniform:08
?
block_10_expand_BN/gamma:0block_10_expand_BN/gamma/Assign.block_10_expand_BN/gamma/Read/ReadVariableOp:0(2+block_10_expand_BN/gamma/Initializer/ones:08
?
block_10_expand_BN/beta:0block_10_expand_BN/beta/Assign-block_10_expand_BN/beta/Read/ReadVariableOp:0(2+block_10_expand_BN/beta/Initializer/zeros:08
?
%block_10_depthwise/depthwise_kernel:0*block_10_depthwise/depthwise_kernel/Assign9block_10_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_10_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_10_depthwise_BN/gamma:0"block_10_depthwise_BN/gamma/Assign1block_10_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_10_depthwise_BN/gamma/Initializer/ones:08
?
block_10_depthwise_BN/beta:0!block_10_depthwise_BN/beta/Assign0block_10_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_10_depthwise_BN/beta/Initializer/zeros:08
?
block_10_project/kernel:0block_10_project/kernel/Assign-block_10_project/kernel/Read/ReadVariableOp:0(24block_10_project/kernel/Initializer/random_uniform:08
?
block_10_project_BN/gamma:0 block_10_project_BN/gamma/Assign/block_10_project_BN/gamma/Read/ReadVariableOp:0(2,block_10_project_BN/gamma/Initializer/ones:08
?
block_10_project_BN/beta:0block_10_project_BN/beta/Assign.block_10_project_BN/beta/Read/ReadVariableOp:0(2,block_10_project_BN/beta/Initializer/zeros:08
?
block_11_expand/kernel:0block_11_expand/kernel/Assign,block_11_expand/kernel/Read/ReadVariableOp:0(23block_11_expand/kernel/Initializer/random_uniform:08
?
block_11_expand_BN/gamma:0block_11_expand_BN/gamma/Assign.block_11_expand_BN/gamma/Read/ReadVariableOp:0(2+block_11_expand_BN/gamma/Initializer/ones:08
?
block_11_expand_BN/beta:0block_11_expand_BN/beta/Assign-block_11_expand_BN/beta/Read/ReadVariableOp:0(2+block_11_expand_BN/beta/Initializer/zeros:08
?
%block_11_depthwise/depthwise_kernel:0*block_11_depthwise/depthwise_kernel/Assign9block_11_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_11_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_11_depthwise_BN/gamma:0"block_11_depthwise_BN/gamma/Assign1block_11_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_11_depthwise_BN/gamma/Initializer/ones:08
?
block_11_depthwise_BN/beta:0!block_11_depthwise_BN/beta/Assign0block_11_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_11_depthwise_BN/beta/Initializer/zeros:08
?
block_11_project/kernel:0block_11_project/kernel/Assign-block_11_project/kernel/Read/ReadVariableOp:0(24block_11_project/kernel/Initializer/random_uniform:08
?
block_11_project_BN/gamma:0 block_11_project_BN/gamma/Assign/block_11_project_BN/gamma/Read/ReadVariableOp:0(2,block_11_project_BN/gamma/Initializer/ones:08
?
block_11_project_BN/beta:0block_11_project_BN/beta/Assign.block_11_project_BN/beta/Read/ReadVariableOp:0(2,block_11_project_BN/beta/Initializer/zeros:08
?
block_12_expand/kernel:0block_12_expand/kernel/Assign,block_12_expand/kernel/Read/ReadVariableOp:0(23block_12_expand/kernel/Initializer/random_uniform:08
?
block_12_expand_BN/gamma:0block_12_expand_BN/gamma/Assign.block_12_expand_BN/gamma/Read/ReadVariableOp:0(2+block_12_expand_BN/gamma/Initializer/ones:08
?
block_12_expand_BN/beta:0block_12_expand_BN/beta/Assign-block_12_expand_BN/beta/Read/ReadVariableOp:0(2+block_12_expand_BN/beta/Initializer/zeros:08
?
%block_12_depthwise/depthwise_kernel:0*block_12_depthwise/depthwise_kernel/Assign9block_12_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_12_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_12_depthwise_BN/gamma:0"block_12_depthwise_BN/gamma/Assign1block_12_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_12_depthwise_BN/gamma/Initializer/ones:08
?
block_12_depthwise_BN/beta:0!block_12_depthwise_BN/beta/Assign0block_12_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_12_depthwise_BN/beta/Initializer/zeros:08
?
block_12_project/kernel:0block_12_project/kernel/Assign-block_12_project/kernel/Read/ReadVariableOp:0(24block_12_project/kernel/Initializer/random_uniform:08
?
block_12_project_BN/gamma:0 block_12_project_BN/gamma/Assign/block_12_project_BN/gamma/Read/ReadVariableOp:0(2,block_12_project_BN/gamma/Initializer/ones:08
?
block_12_project_BN/beta:0block_12_project_BN/beta/Assign.block_12_project_BN/beta/Read/ReadVariableOp:0(2,block_12_project_BN/beta/Initializer/zeros:08
?
block_13_expand/kernel:0block_13_expand/kernel/Assign,block_13_expand/kernel/Read/ReadVariableOp:0(23block_13_expand/kernel/Initializer/random_uniform:08
?
block_13_expand_BN/gamma:0block_13_expand_BN/gamma/Assign.block_13_expand_BN/gamma/Read/ReadVariableOp:0(2+block_13_expand_BN/gamma/Initializer/ones:08
?
block_13_expand_BN/beta:0block_13_expand_BN/beta/Assign-block_13_expand_BN/beta/Read/ReadVariableOp:0(2+block_13_expand_BN/beta/Initializer/zeros:08
?
%block_13_depthwise/depthwise_kernel:0*block_13_depthwise/depthwise_kernel/Assign9block_13_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_13_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_13_depthwise_BN/gamma:0"block_13_depthwise_BN/gamma/Assign1block_13_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_13_depthwise_BN/gamma/Initializer/ones:08
?
block_13_depthwise_BN/beta:0!block_13_depthwise_BN/beta/Assign0block_13_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_13_depthwise_BN/beta/Initializer/zeros:08
?
block_13_project/kernel:0block_13_project/kernel/Assign-block_13_project/kernel/Read/ReadVariableOp:0(24block_13_project/kernel/Initializer/random_uniform:08
?
block_13_project_BN/gamma:0 block_13_project_BN/gamma/Assign/block_13_project_BN/gamma/Read/ReadVariableOp:0(2,block_13_project_BN/gamma/Initializer/ones:08
?
block_13_project_BN/beta:0block_13_project_BN/beta/Assign.block_13_project_BN/beta/Read/ReadVariableOp:0(2,block_13_project_BN/beta/Initializer/zeros:08
?
block_14_expand/kernel:0block_14_expand/kernel/Assign,block_14_expand/kernel/Read/ReadVariableOp:0(23block_14_expand/kernel/Initializer/random_uniform:08
?
block_14_expand_BN/gamma:0block_14_expand_BN/gamma/Assign.block_14_expand_BN/gamma/Read/ReadVariableOp:0(2+block_14_expand_BN/gamma/Initializer/ones:08
?
block_14_expand_BN/beta:0block_14_expand_BN/beta/Assign-block_14_expand_BN/beta/Read/ReadVariableOp:0(2+block_14_expand_BN/beta/Initializer/zeros:08
?
%block_14_depthwise/depthwise_kernel:0*block_14_depthwise/depthwise_kernel/Assign9block_14_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_14_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_14_depthwise_BN/gamma:0"block_14_depthwise_BN/gamma/Assign1block_14_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_14_depthwise_BN/gamma/Initializer/ones:08
?
block_14_depthwise_BN/beta:0!block_14_depthwise_BN/beta/Assign0block_14_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_14_depthwise_BN/beta/Initializer/zeros:08
?
block_14_project/kernel:0block_14_project/kernel/Assign-block_14_project/kernel/Read/ReadVariableOp:0(24block_14_project/kernel/Initializer/random_uniform:08
?
block_14_project_BN/gamma:0 block_14_project_BN/gamma/Assign/block_14_project_BN/gamma/Read/ReadVariableOp:0(2,block_14_project_BN/gamma/Initializer/ones:08
?
block_14_project_BN/beta:0block_14_project_BN/beta/Assign.block_14_project_BN/beta/Read/ReadVariableOp:0(2,block_14_project_BN/beta/Initializer/zeros:08
?
block_15_expand/kernel:0block_15_expand/kernel/Assign,block_15_expand/kernel/Read/ReadVariableOp:0(23block_15_expand/kernel/Initializer/random_uniform:08
?
block_15_expand_BN/gamma:0block_15_expand_BN/gamma/Assign.block_15_expand_BN/gamma/Read/ReadVariableOp:0(2+block_15_expand_BN/gamma/Initializer/ones:08
?
block_15_expand_BN/beta:0block_15_expand_BN/beta/Assign-block_15_expand_BN/beta/Read/ReadVariableOp:0(2+block_15_expand_BN/beta/Initializer/zeros:08
?
%block_15_depthwise/depthwise_kernel:0*block_15_depthwise/depthwise_kernel/Assign9block_15_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_15_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_15_depthwise_BN/gamma:0"block_15_depthwise_BN/gamma/Assign1block_15_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_15_depthwise_BN/gamma/Initializer/ones:08
?
block_15_depthwise_BN/beta:0!block_15_depthwise_BN/beta/Assign0block_15_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_15_depthwise_BN/beta/Initializer/zeros:08
?
block_15_project/kernel:0block_15_project/kernel/Assign-block_15_project/kernel/Read/ReadVariableOp:0(24block_15_project/kernel/Initializer/random_uniform:08
?
block_15_project_BN/gamma:0 block_15_project_BN/gamma/Assign/block_15_project_BN/gamma/Read/ReadVariableOp:0(2,block_15_project_BN/gamma/Initializer/ones:08
?
block_15_project_BN/beta:0block_15_project_BN/beta/Assign.block_15_project_BN/beta/Read/ReadVariableOp:0(2,block_15_project_BN/beta/Initializer/zeros:08
?
block_16_expand/kernel:0block_16_expand/kernel/Assign,block_16_expand/kernel/Read/ReadVariableOp:0(23block_16_expand/kernel/Initializer/random_uniform:08
?
block_16_expand_BN/gamma:0block_16_expand_BN/gamma/Assign.block_16_expand_BN/gamma/Read/ReadVariableOp:0(2+block_16_expand_BN/gamma/Initializer/ones:08
?
block_16_expand_BN/beta:0block_16_expand_BN/beta/Assign-block_16_expand_BN/beta/Read/ReadVariableOp:0(2+block_16_expand_BN/beta/Initializer/zeros:08
?
%block_16_depthwise/depthwise_kernel:0*block_16_depthwise/depthwise_kernel/Assign9block_16_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_16_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_16_depthwise_BN/gamma:0"block_16_depthwise_BN/gamma/Assign1block_16_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_16_depthwise_BN/gamma/Initializer/ones:08
?
block_16_depthwise_BN/beta:0!block_16_depthwise_BN/beta/Assign0block_16_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_16_depthwise_BN/beta/Initializer/zeros:08
?
block_16_project/kernel:0block_16_project/kernel/Assign-block_16_project/kernel/Read/ReadVariableOp:0(24block_16_project/kernel/Initializer/random_uniform:08
?
block_16_project_BN/gamma:0 block_16_project_BN/gamma/Assign/block_16_project_BN/gamma/Read/ReadVariableOp:0(2,block_16_project_BN/gamma/Initializer/ones:08
?
block_16_project_BN/beta:0block_16_project_BN/beta/Assign.block_16_project_BN/beta/Read/ReadVariableOp:0(2,block_16_project_BN/beta/Initializer/zeros:08
|
Conv_1/kernel:0Conv_1/kernel/Assign#Conv_1/kernel/Read/ReadVariableOp:0(2*Conv_1/kernel/Initializer/random_uniform:08
z
Conv_1_bn/gamma:0Conv_1_bn/gamma/Assign%Conv_1_bn/gamma/Read/ReadVariableOp:0(2"Conv_1_bn/gamma/Initializer/ones:08
w
Conv_1_bn/beta:0Conv_1_bn/beta/Assign$Conv_1_bn/beta/Read/ReadVariableOp:0(2"Conv_1_bn/beta/Initializer/zeros:08
?
dense_Dense1/kernel:0dense_Dense1/kernel/Assign)dense_Dense1/kernel/Read/ReadVariableOp:0(22dense_Dense1/kernel/Initializer/truncated_normal:08
?
dense_Dense1/bias:0dense_Dense1/bias/Assign'dense_Dense1/bias/Read/ReadVariableOp:0(2%dense_Dense1/bias/Initializer/zeros:08
?
dense_Dense2/kernel:0dense_Dense2/kernel/Assign)dense_Dense2/kernel/Read/ReadVariableOp:0(22dense_Dense2/kernel/Initializer/truncated_normal:08"??
	variables????
x
Conv1/kernel:0Conv1/kernel/Assign"Conv1/kernel/Read/ReadVariableOp:0(2)Conv1/kernel/Initializer/random_uniform:08
v
bn_Conv1/gamma:0bn_Conv1/gamma/Assign$bn_Conv1/gamma/Read/ReadVariableOp:0(2!bn_Conv1/gamma/Initializer/ones:08
s
bn_Conv1/beta:0bn_Conv1/beta/Assign#bn_Conv1/beta/Read/ReadVariableOp:0(2!bn_Conv1/beta/Initializer/zeros:08
?
bn_Conv1/moving_mean:0bn_Conv1/moving_mean/Assign*bn_Conv1/moving_mean/Read/ReadVariableOp:0(2(bn_Conv1/moving_mean/Initializer/zeros:0@H
?
bn_Conv1/moving_variance:0bn_Conv1/moving_variance/Assign.bn_Conv1/moving_variance/Read/ReadVariableOp:0(2+bn_Conv1/moving_variance/Initializer/ones:0@H
?
*expanded_conv_depthwise/depthwise_kernel:0/expanded_conv_depthwise/depthwise_kernel/Assign>expanded_conv_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2Eexpanded_conv_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
"expanded_conv_depthwise_BN/gamma:0'expanded_conv_depthwise_BN/gamma/Assign6expanded_conv_depthwise_BN/gamma/Read/ReadVariableOp:0(23expanded_conv_depthwise_BN/gamma/Initializer/ones:08
?
!expanded_conv_depthwise_BN/beta:0&expanded_conv_depthwise_BN/beta/Assign5expanded_conv_depthwise_BN/beta/Read/ReadVariableOp:0(23expanded_conv_depthwise_BN/beta/Initializer/zeros:08
?
(expanded_conv_depthwise_BN/moving_mean:0-expanded_conv_depthwise_BN/moving_mean/Assign<expanded_conv_depthwise_BN/moving_mean/Read/ReadVariableOp:0(2:expanded_conv_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
,expanded_conv_depthwise_BN/moving_variance:01expanded_conv_depthwise_BN/moving_variance/Assign@expanded_conv_depthwise_BN/moving_variance/Read/ReadVariableOp:0(2=expanded_conv_depthwise_BN/moving_variance/Initializer/ones:0@H
?
expanded_conv_project/kernel:0#expanded_conv_project/kernel/Assign2expanded_conv_project/kernel/Read/ReadVariableOp:0(29expanded_conv_project/kernel/Initializer/random_uniform:08
?
 expanded_conv_project_BN/gamma:0%expanded_conv_project_BN/gamma/Assign4expanded_conv_project_BN/gamma/Read/ReadVariableOp:0(21expanded_conv_project_BN/gamma/Initializer/ones:08
?
expanded_conv_project_BN/beta:0$expanded_conv_project_BN/beta/Assign3expanded_conv_project_BN/beta/Read/ReadVariableOp:0(21expanded_conv_project_BN/beta/Initializer/zeros:08
?
&expanded_conv_project_BN/moving_mean:0+expanded_conv_project_BN/moving_mean/Assign:expanded_conv_project_BN/moving_mean/Read/ReadVariableOp:0(28expanded_conv_project_BN/moving_mean/Initializer/zeros:0@H
?
*expanded_conv_project_BN/moving_variance:0/expanded_conv_project_BN/moving_variance/Assign>expanded_conv_project_BN/moving_variance/Read/ReadVariableOp:0(2;expanded_conv_project_BN/moving_variance/Initializer/ones:0@H
?
block_1_expand/kernel:0block_1_expand/kernel/Assign+block_1_expand/kernel/Read/ReadVariableOp:0(22block_1_expand/kernel/Initializer/random_uniform:08
?
block_1_expand_BN/gamma:0block_1_expand_BN/gamma/Assign-block_1_expand_BN/gamma/Read/ReadVariableOp:0(2*block_1_expand_BN/gamma/Initializer/ones:08
?
block_1_expand_BN/beta:0block_1_expand_BN/beta/Assign,block_1_expand_BN/beta/Read/ReadVariableOp:0(2*block_1_expand_BN/beta/Initializer/zeros:08
?
block_1_expand_BN/moving_mean:0$block_1_expand_BN/moving_mean/Assign3block_1_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_1_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_1_expand_BN/moving_variance:0(block_1_expand_BN/moving_variance/Assign7block_1_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_1_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_1_depthwise/depthwise_kernel:0)block_1_depthwise/depthwise_kernel/Assign8block_1_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_1_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_1_depthwise_BN/gamma:0!block_1_depthwise_BN/gamma/Assign0block_1_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_1_depthwise_BN/gamma/Initializer/ones:08
?
block_1_depthwise_BN/beta:0 block_1_depthwise_BN/beta/Assign/block_1_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_1_depthwise_BN/beta/Initializer/zeros:08
?
"block_1_depthwise_BN/moving_mean:0'block_1_depthwise_BN/moving_mean/Assign6block_1_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_1_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_1_depthwise_BN/moving_variance:0+block_1_depthwise_BN/moving_variance/Assign:block_1_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_1_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_1_project/kernel:0block_1_project/kernel/Assign,block_1_project/kernel/Read/ReadVariableOp:0(23block_1_project/kernel/Initializer/random_uniform:08
?
block_1_project_BN/gamma:0block_1_project_BN/gamma/Assign.block_1_project_BN/gamma/Read/ReadVariableOp:0(2+block_1_project_BN/gamma/Initializer/ones:08
?
block_1_project_BN/beta:0block_1_project_BN/beta/Assign-block_1_project_BN/beta/Read/ReadVariableOp:0(2+block_1_project_BN/beta/Initializer/zeros:08
?
 block_1_project_BN/moving_mean:0%block_1_project_BN/moving_mean/Assign4block_1_project_BN/moving_mean/Read/ReadVariableOp:0(22block_1_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_1_project_BN/moving_variance:0)block_1_project_BN/moving_variance/Assign8block_1_project_BN/moving_variance/Read/ReadVariableOp:0(25block_1_project_BN/moving_variance/Initializer/ones:0@H
?
block_2_expand/kernel:0block_2_expand/kernel/Assign+block_2_expand/kernel/Read/ReadVariableOp:0(22block_2_expand/kernel/Initializer/random_uniform:08
?
block_2_expand_BN/gamma:0block_2_expand_BN/gamma/Assign-block_2_expand_BN/gamma/Read/ReadVariableOp:0(2*block_2_expand_BN/gamma/Initializer/ones:08
?
block_2_expand_BN/beta:0block_2_expand_BN/beta/Assign,block_2_expand_BN/beta/Read/ReadVariableOp:0(2*block_2_expand_BN/beta/Initializer/zeros:08
?
block_2_expand_BN/moving_mean:0$block_2_expand_BN/moving_mean/Assign3block_2_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_2_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_2_expand_BN/moving_variance:0(block_2_expand_BN/moving_variance/Assign7block_2_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_2_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_2_depthwise/depthwise_kernel:0)block_2_depthwise/depthwise_kernel/Assign8block_2_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_2_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_2_depthwise_BN/gamma:0!block_2_depthwise_BN/gamma/Assign0block_2_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_2_depthwise_BN/gamma/Initializer/ones:08
?
block_2_depthwise_BN/beta:0 block_2_depthwise_BN/beta/Assign/block_2_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_2_depthwise_BN/beta/Initializer/zeros:08
?
"block_2_depthwise_BN/moving_mean:0'block_2_depthwise_BN/moving_mean/Assign6block_2_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_2_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_2_depthwise_BN/moving_variance:0+block_2_depthwise_BN/moving_variance/Assign:block_2_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_2_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_2_project/kernel:0block_2_project/kernel/Assign,block_2_project/kernel/Read/ReadVariableOp:0(23block_2_project/kernel/Initializer/random_uniform:08
?
block_2_project_BN/gamma:0block_2_project_BN/gamma/Assign.block_2_project_BN/gamma/Read/ReadVariableOp:0(2+block_2_project_BN/gamma/Initializer/ones:08
?
block_2_project_BN/beta:0block_2_project_BN/beta/Assign-block_2_project_BN/beta/Read/ReadVariableOp:0(2+block_2_project_BN/beta/Initializer/zeros:08
?
 block_2_project_BN/moving_mean:0%block_2_project_BN/moving_mean/Assign4block_2_project_BN/moving_mean/Read/ReadVariableOp:0(22block_2_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_2_project_BN/moving_variance:0)block_2_project_BN/moving_variance/Assign8block_2_project_BN/moving_variance/Read/ReadVariableOp:0(25block_2_project_BN/moving_variance/Initializer/ones:0@H
?
block_3_expand/kernel:0block_3_expand/kernel/Assign+block_3_expand/kernel/Read/ReadVariableOp:0(22block_3_expand/kernel/Initializer/random_uniform:08
?
block_3_expand_BN/gamma:0block_3_expand_BN/gamma/Assign-block_3_expand_BN/gamma/Read/ReadVariableOp:0(2*block_3_expand_BN/gamma/Initializer/ones:08
?
block_3_expand_BN/beta:0block_3_expand_BN/beta/Assign,block_3_expand_BN/beta/Read/ReadVariableOp:0(2*block_3_expand_BN/beta/Initializer/zeros:08
?
block_3_expand_BN/moving_mean:0$block_3_expand_BN/moving_mean/Assign3block_3_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_3_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_3_expand_BN/moving_variance:0(block_3_expand_BN/moving_variance/Assign7block_3_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_3_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_3_depthwise/depthwise_kernel:0)block_3_depthwise/depthwise_kernel/Assign8block_3_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_3_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_3_depthwise_BN/gamma:0!block_3_depthwise_BN/gamma/Assign0block_3_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_3_depthwise_BN/gamma/Initializer/ones:08
?
block_3_depthwise_BN/beta:0 block_3_depthwise_BN/beta/Assign/block_3_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_3_depthwise_BN/beta/Initializer/zeros:08
?
"block_3_depthwise_BN/moving_mean:0'block_3_depthwise_BN/moving_mean/Assign6block_3_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_3_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_3_depthwise_BN/moving_variance:0+block_3_depthwise_BN/moving_variance/Assign:block_3_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_3_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_3_project/kernel:0block_3_project/kernel/Assign,block_3_project/kernel/Read/ReadVariableOp:0(23block_3_project/kernel/Initializer/random_uniform:08
?
block_3_project_BN/gamma:0block_3_project_BN/gamma/Assign.block_3_project_BN/gamma/Read/ReadVariableOp:0(2+block_3_project_BN/gamma/Initializer/ones:08
?
block_3_project_BN/beta:0block_3_project_BN/beta/Assign-block_3_project_BN/beta/Read/ReadVariableOp:0(2+block_3_project_BN/beta/Initializer/zeros:08
?
 block_3_project_BN/moving_mean:0%block_3_project_BN/moving_mean/Assign4block_3_project_BN/moving_mean/Read/ReadVariableOp:0(22block_3_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_3_project_BN/moving_variance:0)block_3_project_BN/moving_variance/Assign8block_3_project_BN/moving_variance/Read/ReadVariableOp:0(25block_3_project_BN/moving_variance/Initializer/ones:0@H
?
block_4_expand/kernel:0block_4_expand/kernel/Assign+block_4_expand/kernel/Read/ReadVariableOp:0(22block_4_expand/kernel/Initializer/random_uniform:08
?
block_4_expand_BN/gamma:0block_4_expand_BN/gamma/Assign-block_4_expand_BN/gamma/Read/ReadVariableOp:0(2*block_4_expand_BN/gamma/Initializer/ones:08
?
block_4_expand_BN/beta:0block_4_expand_BN/beta/Assign,block_4_expand_BN/beta/Read/ReadVariableOp:0(2*block_4_expand_BN/beta/Initializer/zeros:08
?
block_4_expand_BN/moving_mean:0$block_4_expand_BN/moving_mean/Assign3block_4_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_4_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_4_expand_BN/moving_variance:0(block_4_expand_BN/moving_variance/Assign7block_4_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_4_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_4_depthwise/depthwise_kernel:0)block_4_depthwise/depthwise_kernel/Assign8block_4_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_4_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_4_depthwise_BN/gamma:0!block_4_depthwise_BN/gamma/Assign0block_4_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_4_depthwise_BN/gamma/Initializer/ones:08
?
block_4_depthwise_BN/beta:0 block_4_depthwise_BN/beta/Assign/block_4_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_4_depthwise_BN/beta/Initializer/zeros:08
?
"block_4_depthwise_BN/moving_mean:0'block_4_depthwise_BN/moving_mean/Assign6block_4_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_4_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_4_depthwise_BN/moving_variance:0+block_4_depthwise_BN/moving_variance/Assign:block_4_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_4_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_4_project/kernel:0block_4_project/kernel/Assign,block_4_project/kernel/Read/ReadVariableOp:0(23block_4_project/kernel/Initializer/random_uniform:08
?
block_4_project_BN/gamma:0block_4_project_BN/gamma/Assign.block_4_project_BN/gamma/Read/ReadVariableOp:0(2+block_4_project_BN/gamma/Initializer/ones:08
?
block_4_project_BN/beta:0block_4_project_BN/beta/Assign-block_4_project_BN/beta/Read/ReadVariableOp:0(2+block_4_project_BN/beta/Initializer/zeros:08
?
 block_4_project_BN/moving_mean:0%block_4_project_BN/moving_mean/Assign4block_4_project_BN/moving_mean/Read/ReadVariableOp:0(22block_4_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_4_project_BN/moving_variance:0)block_4_project_BN/moving_variance/Assign8block_4_project_BN/moving_variance/Read/ReadVariableOp:0(25block_4_project_BN/moving_variance/Initializer/ones:0@H
?
block_5_expand/kernel:0block_5_expand/kernel/Assign+block_5_expand/kernel/Read/ReadVariableOp:0(22block_5_expand/kernel/Initializer/random_uniform:08
?
block_5_expand_BN/gamma:0block_5_expand_BN/gamma/Assign-block_5_expand_BN/gamma/Read/ReadVariableOp:0(2*block_5_expand_BN/gamma/Initializer/ones:08
?
block_5_expand_BN/beta:0block_5_expand_BN/beta/Assign,block_5_expand_BN/beta/Read/ReadVariableOp:0(2*block_5_expand_BN/beta/Initializer/zeros:08
?
block_5_expand_BN/moving_mean:0$block_5_expand_BN/moving_mean/Assign3block_5_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_5_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_5_expand_BN/moving_variance:0(block_5_expand_BN/moving_variance/Assign7block_5_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_5_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_5_depthwise/depthwise_kernel:0)block_5_depthwise/depthwise_kernel/Assign8block_5_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_5_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_5_depthwise_BN/gamma:0!block_5_depthwise_BN/gamma/Assign0block_5_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_5_depthwise_BN/gamma/Initializer/ones:08
?
block_5_depthwise_BN/beta:0 block_5_depthwise_BN/beta/Assign/block_5_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_5_depthwise_BN/beta/Initializer/zeros:08
?
"block_5_depthwise_BN/moving_mean:0'block_5_depthwise_BN/moving_mean/Assign6block_5_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_5_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_5_depthwise_BN/moving_variance:0+block_5_depthwise_BN/moving_variance/Assign:block_5_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_5_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_5_project/kernel:0block_5_project/kernel/Assign,block_5_project/kernel/Read/ReadVariableOp:0(23block_5_project/kernel/Initializer/random_uniform:08
?
block_5_project_BN/gamma:0block_5_project_BN/gamma/Assign.block_5_project_BN/gamma/Read/ReadVariableOp:0(2+block_5_project_BN/gamma/Initializer/ones:08
?
block_5_project_BN/beta:0block_5_project_BN/beta/Assign-block_5_project_BN/beta/Read/ReadVariableOp:0(2+block_5_project_BN/beta/Initializer/zeros:08
?
 block_5_project_BN/moving_mean:0%block_5_project_BN/moving_mean/Assign4block_5_project_BN/moving_mean/Read/ReadVariableOp:0(22block_5_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_5_project_BN/moving_variance:0)block_5_project_BN/moving_variance/Assign8block_5_project_BN/moving_variance/Read/ReadVariableOp:0(25block_5_project_BN/moving_variance/Initializer/ones:0@H
?
block_6_expand/kernel:0block_6_expand/kernel/Assign+block_6_expand/kernel/Read/ReadVariableOp:0(22block_6_expand/kernel/Initializer/random_uniform:08
?
block_6_expand_BN/gamma:0block_6_expand_BN/gamma/Assign-block_6_expand_BN/gamma/Read/ReadVariableOp:0(2*block_6_expand_BN/gamma/Initializer/ones:08
?
block_6_expand_BN/beta:0block_6_expand_BN/beta/Assign,block_6_expand_BN/beta/Read/ReadVariableOp:0(2*block_6_expand_BN/beta/Initializer/zeros:08
?
block_6_expand_BN/moving_mean:0$block_6_expand_BN/moving_mean/Assign3block_6_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_6_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_6_expand_BN/moving_variance:0(block_6_expand_BN/moving_variance/Assign7block_6_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_6_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_6_depthwise/depthwise_kernel:0)block_6_depthwise/depthwise_kernel/Assign8block_6_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_6_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_6_depthwise_BN/gamma:0!block_6_depthwise_BN/gamma/Assign0block_6_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_6_depthwise_BN/gamma/Initializer/ones:08
?
block_6_depthwise_BN/beta:0 block_6_depthwise_BN/beta/Assign/block_6_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_6_depthwise_BN/beta/Initializer/zeros:08
?
"block_6_depthwise_BN/moving_mean:0'block_6_depthwise_BN/moving_mean/Assign6block_6_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_6_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_6_depthwise_BN/moving_variance:0+block_6_depthwise_BN/moving_variance/Assign:block_6_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_6_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_6_project/kernel:0block_6_project/kernel/Assign,block_6_project/kernel/Read/ReadVariableOp:0(23block_6_project/kernel/Initializer/random_uniform:08
?
block_6_project_BN/gamma:0block_6_project_BN/gamma/Assign.block_6_project_BN/gamma/Read/ReadVariableOp:0(2+block_6_project_BN/gamma/Initializer/ones:08
?
block_6_project_BN/beta:0block_6_project_BN/beta/Assign-block_6_project_BN/beta/Read/ReadVariableOp:0(2+block_6_project_BN/beta/Initializer/zeros:08
?
 block_6_project_BN/moving_mean:0%block_6_project_BN/moving_mean/Assign4block_6_project_BN/moving_mean/Read/ReadVariableOp:0(22block_6_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_6_project_BN/moving_variance:0)block_6_project_BN/moving_variance/Assign8block_6_project_BN/moving_variance/Read/ReadVariableOp:0(25block_6_project_BN/moving_variance/Initializer/ones:0@H
?
block_7_expand/kernel:0block_7_expand/kernel/Assign+block_7_expand/kernel/Read/ReadVariableOp:0(22block_7_expand/kernel/Initializer/random_uniform:08
?
block_7_expand_BN/gamma:0block_7_expand_BN/gamma/Assign-block_7_expand_BN/gamma/Read/ReadVariableOp:0(2*block_7_expand_BN/gamma/Initializer/ones:08
?
block_7_expand_BN/beta:0block_7_expand_BN/beta/Assign,block_7_expand_BN/beta/Read/ReadVariableOp:0(2*block_7_expand_BN/beta/Initializer/zeros:08
?
block_7_expand_BN/moving_mean:0$block_7_expand_BN/moving_mean/Assign3block_7_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_7_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_7_expand_BN/moving_variance:0(block_7_expand_BN/moving_variance/Assign7block_7_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_7_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_7_depthwise/depthwise_kernel:0)block_7_depthwise/depthwise_kernel/Assign8block_7_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_7_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_7_depthwise_BN/gamma:0!block_7_depthwise_BN/gamma/Assign0block_7_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_7_depthwise_BN/gamma/Initializer/ones:08
?
block_7_depthwise_BN/beta:0 block_7_depthwise_BN/beta/Assign/block_7_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_7_depthwise_BN/beta/Initializer/zeros:08
?
"block_7_depthwise_BN/moving_mean:0'block_7_depthwise_BN/moving_mean/Assign6block_7_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_7_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_7_depthwise_BN/moving_variance:0+block_7_depthwise_BN/moving_variance/Assign:block_7_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_7_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_7_project/kernel:0block_7_project/kernel/Assign,block_7_project/kernel/Read/ReadVariableOp:0(23block_7_project/kernel/Initializer/random_uniform:08
?
block_7_project_BN/gamma:0block_7_project_BN/gamma/Assign.block_7_project_BN/gamma/Read/ReadVariableOp:0(2+block_7_project_BN/gamma/Initializer/ones:08
?
block_7_project_BN/beta:0block_7_project_BN/beta/Assign-block_7_project_BN/beta/Read/ReadVariableOp:0(2+block_7_project_BN/beta/Initializer/zeros:08
?
 block_7_project_BN/moving_mean:0%block_7_project_BN/moving_mean/Assign4block_7_project_BN/moving_mean/Read/ReadVariableOp:0(22block_7_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_7_project_BN/moving_variance:0)block_7_project_BN/moving_variance/Assign8block_7_project_BN/moving_variance/Read/ReadVariableOp:0(25block_7_project_BN/moving_variance/Initializer/ones:0@H
?
block_8_expand/kernel:0block_8_expand/kernel/Assign+block_8_expand/kernel/Read/ReadVariableOp:0(22block_8_expand/kernel/Initializer/random_uniform:08
?
block_8_expand_BN/gamma:0block_8_expand_BN/gamma/Assign-block_8_expand_BN/gamma/Read/ReadVariableOp:0(2*block_8_expand_BN/gamma/Initializer/ones:08
?
block_8_expand_BN/beta:0block_8_expand_BN/beta/Assign,block_8_expand_BN/beta/Read/ReadVariableOp:0(2*block_8_expand_BN/beta/Initializer/zeros:08
?
block_8_expand_BN/moving_mean:0$block_8_expand_BN/moving_mean/Assign3block_8_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_8_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_8_expand_BN/moving_variance:0(block_8_expand_BN/moving_variance/Assign7block_8_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_8_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_8_depthwise/depthwise_kernel:0)block_8_depthwise/depthwise_kernel/Assign8block_8_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_8_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_8_depthwise_BN/gamma:0!block_8_depthwise_BN/gamma/Assign0block_8_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_8_depthwise_BN/gamma/Initializer/ones:08
?
block_8_depthwise_BN/beta:0 block_8_depthwise_BN/beta/Assign/block_8_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_8_depthwise_BN/beta/Initializer/zeros:08
?
"block_8_depthwise_BN/moving_mean:0'block_8_depthwise_BN/moving_mean/Assign6block_8_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_8_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_8_depthwise_BN/moving_variance:0+block_8_depthwise_BN/moving_variance/Assign:block_8_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_8_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_8_project/kernel:0block_8_project/kernel/Assign,block_8_project/kernel/Read/ReadVariableOp:0(23block_8_project/kernel/Initializer/random_uniform:08
?
block_8_project_BN/gamma:0block_8_project_BN/gamma/Assign.block_8_project_BN/gamma/Read/ReadVariableOp:0(2+block_8_project_BN/gamma/Initializer/ones:08
?
block_8_project_BN/beta:0block_8_project_BN/beta/Assign-block_8_project_BN/beta/Read/ReadVariableOp:0(2+block_8_project_BN/beta/Initializer/zeros:08
?
 block_8_project_BN/moving_mean:0%block_8_project_BN/moving_mean/Assign4block_8_project_BN/moving_mean/Read/ReadVariableOp:0(22block_8_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_8_project_BN/moving_variance:0)block_8_project_BN/moving_variance/Assign8block_8_project_BN/moving_variance/Read/ReadVariableOp:0(25block_8_project_BN/moving_variance/Initializer/ones:0@H
?
block_9_expand/kernel:0block_9_expand/kernel/Assign+block_9_expand/kernel/Read/ReadVariableOp:0(22block_9_expand/kernel/Initializer/random_uniform:08
?
block_9_expand_BN/gamma:0block_9_expand_BN/gamma/Assign-block_9_expand_BN/gamma/Read/ReadVariableOp:0(2*block_9_expand_BN/gamma/Initializer/ones:08
?
block_9_expand_BN/beta:0block_9_expand_BN/beta/Assign,block_9_expand_BN/beta/Read/ReadVariableOp:0(2*block_9_expand_BN/beta/Initializer/zeros:08
?
block_9_expand_BN/moving_mean:0$block_9_expand_BN/moving_mean/Assign3block_9_expand_BN/moving_mean/Read/ReadVariableOp:0(21block_9_expand_BN/moving_mean/Initializer/zeros:0@H
?
#block_9_expand_BN/moving_variance:0(block_9_expand_BN/moving_variance/Assign7block_9_expand_BN/moving_variance/Read/ReadVariableOp:0(24block_9_expand_BN/moving_variance/Initializer/ones:0@H
?
$block_9_depthwise/depthwise_kernel:0)block_9_depthwise/depthwise_kernel/Assign8block_9_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2?block_9_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_9_depthwise_BN/gamma:0!block_9_depthwise_BN/gamma/Assign0block_9_depthwise_BN/gamma/Read/ReadVariableOp:0(2-block_9_depthwise_BN/gamma/Initializer/ones:08
?
block_9_depthwise_BN/beta:0 block_9_depthwise_BN/beta/Assign/block_9_depthwise_BN/beta/Read/ReadVariableOp:0(2-block_9_depthwise_BN/beta/Initializer/zeros:08
?
"block_9_depthwise_BN/moving_mean:0'block_9_depthwise_BN/moving_mean/Assign6block_9_depthwise_BN/moving_mean/Read/ReadVariableOp:0(24block_9_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
&block_9_depthwise_BN/moving_variance:0+block_9_depthwise_BN/moving_variance/Assign:block_9_depthwise_BN/moving_variance/Read/ReadVariableOp:0(27block_9_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_9_project/kernel:0block_9_project/kernel/Assign,block_9_project/kernel/Read/ReadVariableOp:0(23block_9_project/kernel/Initializer/random_uniform:08
?
block_9_project_BN/gamma:0block_9_project_BN/gamma/Assign.block_9_project_BN/gamma/Read/ReadVariableOp:0(2+block_9_project_BN/gamma/Initializer/ones:08
?
block_9_project_BN/beta:0block_9_project_BN/beta/Assign-block_9_project_BN/beta/Read/ReadVariableOp:0(2+block_9_project_BN/beta/Initializer/zeros:08
?
 block_9_project_BN/moving_mean:0%block_9_project_BN/moving_mean/Assign4block_9_project_BN/moving_mean/Read/ReadVariableOp:0(22block_9_project_BN/moving_mean/Initializer/zeros:0@H
?
$block_9_project_BN/moving_variance:0)block_9_project_BN/moving_variance/Assign8block_9_project_BN/moving_variance/Read/ReadVariableOp:0(25block_9_project_BN/moving_variance/Initializer/ones:0@H
?
block_10_expand/kernel:0block_10_expand/kernel/Assign,block_10_expand/kernel/Read/ReadVariableOp:0(23block_10_expand/kernel/Initializer/random_uniform:08
?
block_10_expand_BN/gamma:0block_10_expand_BN/gamma/Assign.block_10_expand_BN/gamma/Read/ReadVariableOp:0(2+block_10_expand_BN/gamma/Initializer/ones:08
?
block_10_expand_BN/beta:0block_10_expand_BN/beta/Assign-block_10_expand_BN/beta/Read/ReadVariableOp:0(2+block_10_expand_BN/beta/Initializer/zeros:08
?
 block_10_expand_BN/moving_mean:0%block_10_expand_BN/moving_mean/Assign4block_10_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_10_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_10_expand_BN/moving_variance:0)block_10_expand_BN/moving_variance/Assign8block_10_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_10_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_10_depthwise/depthwise_kernel:0*block_10_depthwise/depthwise_kernel/Assign9block_10_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_10_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_10_depthwise_BN/gamma:0"block_10_depthwise_BN/gamma/Assign1block_10_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_10_depthwise_BN/gamma/Initializer/ones:08
?
block_10_depthwise_BN/beta:0!block_10_depthwise_BN/beta/Assign0block_10_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_10_depthwise_BN/beta/Initializer/zeros:08
?
#block_10_depthwise_BN/moving_mean:0(block_10_depthwise_BN/moving_mean/Assign7block_10_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_10_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_10_depthwise_BN/moving_variance:0,block_10_depthwise_BN/moving_variance/Assign;block_10_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_10_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_10_project/kernel:0block_10_project/kernel/Assign-block_10_project/kernel/Read/ReadVariableOp:0(24block_10_project/kernel/Initializer/random_uniform:08
?
block_10_project_BN/gamma:0 block_10_project_BN/gamma/Assign/block_10_project_BN/gamma/Read/ReadVariableOp:0(2,block_10_project_BN/gamma/Initializer/ones:08
?
block_10_project_BN/beta:0block_10_project_BN/beta/Assign.block_10_project_BN/beta/Read/ReadVariableOp:0(2,block_10_project_BN/beta/Initializer/zeros:08
?
!block_10_project_BN/moving_mean:0&block_10_project_BN/moving_mean/Assign5block_10_project_BN/moving_mean/Read/ReadVariableOp:0(23block_10_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_10_project_BN/moving_variance:0*block_10_project_BN/moving_variance/Assign9block_10_project_BN/moving_variance/Read/ReadVariableOp:0(26block_10_project_BN/moving_variance/Initializer/ones:0@H
?
block_11_expand/kernel:0block_11_expand/kernel/Assign,block_11_expand/kernel/Read/ReadVariableOp:0(23block_11_expand/kernel/Initializer/random_uniform:08
?
block_11_expand_BN/gamma:0block_11_expand_BN/gamma/Assign.block_11_expand_BN/gamma/Read/ReadVariableOp:0(2+block_11_expand_BN/gamma/Initializer/ones:08
?
block_11_expand_BN/beta:0block_11_expand_BN/beta/Assign-block_11_expand_BN/beta/Read/ReadVariableOp:0(2+block_11_expand_BN/beta/Initializer/zeros:08
?
 block_11_expand_BN/moving_mean:0%block_11_expand_BN/moving_mean/Assign4block_11_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_11_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_11_expand_BN/moving_variance:0)block_11_expand_BN/moving_variance/Assign8block_11_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_11_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_11_depthwise/depthwise_kernel:0*block_11_depthwise/depthwise_kernel/Assign9block_11_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_11_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_11_depthwise_BN/gamma:0"block_11_depthwise_BN/gamma/Assign1block_11_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_11_depthwise_BN/gamma/Initializer/ones:08
?
block_11_depthwise_BN/beta:0!block_11_depthwise_BN/beta/Assign0block_11_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_11_depthwise_BN/beta/Initializer/zeros:08
?
#block_11_depthwise_BN/moving_mean:0(block_11_depthwise_BN/moving_mean/Assign7block_11_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_11_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_11_depthwise_BN/moving_variance:0,block_11_depthwise_BN/moving_variance/Assign;block_11_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_11_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_11_project/kernel:0block_11_project/kernel/Assign-block_11_project/kernel/Read/ReadVariableOp:0(24block_11_project/kernel/Initializer/random_uniform:08
?
block_11_project_BN/gamma:0 block_11_project_BN/gamma/Assign/block_11_project_BN/gamma/Read/ReadVariableOp:0(2,block_11_project_BN/gamma/Initializer/ones:08
?
block_11_project_BN/beta:0block_11_project_BN/beta/Assign.block_11_project_BN/beta/Read/ReadVariableOp:0(2,block_11_project_BN/beta/Initializer/zeros:08
?
!block_11_project_BN/moving_mean:0&block_11_project_BN/moving_mean/Assign5block_11_project_BN/moving_mean/Read/ReadVariableOp:0(23block_11_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_11_project_BN/moving_variance:0*block_11_project_BN/moving_variance/Assign9block_11_project_BN/moving_variance/Read/ReadVariableOp:0(26block_11_project_BN/moving_variance/Initializer/ones:0@H
?
block_12_expand/kernel:0block_12_expand/kernel/Assign,block_12_expand/kernel/Read/ReadVariableOp:0(23block_12_expand/kernel/Initializer/random_uniform:08
?
block_12_expand_BN/gamma:0block_12_expand_BN/gamma/Assign.block_12_expand_BN/gamma/Read/ReadVariableOp:0(2+block_12_expand_BN/gamma/Initializer/ones:08
?
block_12_expand_BN/beta:0block_12_expand_BN/beta/Assign-block_12_expand_BN/beta/Read/ReadVariableOp:0(2+block_12_expand_BN/beta/Initializer/zeros:08
?
 block_12_expand_BN/moving_mean:0%block_12_expand_BN/moving_mean/Assign4block_12_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_12_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_12_expand_BN/moving_variance:0)block_12_expand_BN/moving_variance/Assign8block_12_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_12_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_12_depthwise/depthwise_kernel:0*block_12_depthwise/depthwise_kernel/Assign9block_12_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_12_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_12_depthwise_BN/gamma:0"block_12_depthwise_BN/gamma/Assign1block_12_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_12_depthwise_BN/gamma/Initializer/ones:08
?
block_12_depthwise_BN/beta:0!block_12_depthwise_BN/beta/Assign0block_12_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_12_depthwise_BN/beta/Initializer/zeros:08
?
#block_12_depthwise_BN/moving_mean:0(block_12_depthwise_BN/moving_mean/Assign7block_12_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_12_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_12_depthwise_BN/moving_variance:0,block_12_depthwise_BN/moving_variance/Assign;block_12_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_12_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_12_project/kernel:0block_12_project/kernel/Assign-block_12_project/kernel/Read/ReadVariableOp:0(24block_12_project/kernel/Initializer/random_uniform:08
?
block_12_project_BN/gamma:0 block_12_project_BN/gamma/Assign/block_12_project_BN/gamma/Read/ReadVariableOp:0(2,block_12_project_BN/gamma/Initializer/ones:08
?
block_12_project_BN/beta:0block_12_project_BN/beta/Assign.block_12_project_BN/beta/Read/ReadVariableOp:0(2,block_12_project_BN/beta/Initializer/zeros:08
?
!block_12_project_BN/moving_mean:0&block_12_project_BN/moving_mean/Assign5block_12_project_BN/moving_mean/Read/ReadVariableOp:0(23block_12_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_12_project_BN/moving_variance:0*block_12_project_BN/moving_variance/Assign9block_12_project_BN/moving_variance/Read/ReadVariableOp:0(26block_12_project_BN/moving_variance/Initializer/ones:0@H
?
block_13_expand/kernel:0block_13_expand/kernel/Assign,block_13_expand/kernel/Read/ReadVariableOp:0(23block_13_expand/kernel/Initializer/random_uniform:08
?
block_13_expand_BN/gamma:0block_13_expand_BN/gamma/Assign.block_13_expand_BN/gamma/Read/ReadVariableOp:0(2+block_13_expand_BN/gamma/Initializer/ones:08
?
block_13_expand_BN/beta:0block_13_expand_BN/beta/Assign-block_13_expand_BN/beta/Read/ReadVariableOp:0(2+block_13_expand_BN/beta/Initializer/zeros:08
?
 block_13_expand_BN/moving_mean:0%block_13_expand_BN/moving_mean/Assign4block_13_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_13_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_13_expand_BN/moving_variance:0)block_13_expand_BN/moving_variance/Assign8block_13_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_13_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_13_depthwise/depthwise_kernel:0*block_13_depthwise/depthwise_kernel/Assign9block_13_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_13_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_13_depthwise_BN/gamma:0"block_13_depthwise_BN/gamma/Assign1block_13_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_13_depthwise_BN/gamma/Initializer/ones:08
?
block_13_depthwise_BN/beta:0!block_13_depthwise_BN/beta/Assign0block_13_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_13_depthwise_BN/beta/Initializer/zeros:08
?
#block_13_depthwise_BN/moving_mean:0(block_13_depthwise_BN/moving_mean/Assign7block_13_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_13_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_13_depthwise_BN/moving_variance:0,block_13_depthwise_BN/moving_variance/Assign;block_13_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_13_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_13_project/kernel:0block_13_project/kernel/Assign-block_13_project/kernel/Read/ReadVariableOp:0(24block_13_project/kernel/Initializer/random_uniform:08
?
block_13_project_BN/gamma:0 block_13_project_BN/gamma/Assign/block_13_project_BN/gamma/Read/ReadVariableOp:0(2,block_13_project_BN/gamma/Initializer/ones:08
?
block_13_project_BN/beta:0block_13_project_BN/beta/Assign.block_13_project_BN/beta/Read/ReadVariableOp:0(2,block_13_project_BN/beta/Initializer/zeros:08
?
!block_13_project_BN/moving_mean:0&block_13_project_BN/moving_mean/Assign5block_13_project_BN/moving_mean/Read/ReadVariableOp:0(23block_13_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_13_project_BN/moving_variance:0*block_13_project_BN/moving_variance/Assign9block_13_project_BN/moving_variance/Read/ReadVariableOp:0(26block_13_project_BN/moving_variance/Initializer/ones:0@H
?
block_14_expand/kernel:0block_14_expand/kernel/Assign,block_14_expand/kernel/Read/ReadVariableOp:0(23block_14_expand/kernel/Initializer/random_uniform:08
?
block_14_expand_BN/gamma:0block_14_expand_BN/gamma/Assign.block_14_expand_BN/gamma/Read/ReadVariableOp:0(2+block_14_expand_BN/gamma/Initializer/ones:08
?
block_14_expand_BN/beta:0block_14_expand_BN/beta/Assign-block_14_expand_BN/beta/Read/ReadVariableOp:0(2+block_14_expand_BN/beta/Initializer/zeros:08
?
 block_14_expand_BN/moving_mean:0%block_14_expand_BN/moving_mean/Assign4block_14_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_14_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_14_expand_BN/moving_variance:0)block_14_expand_BN/moving_variance/Assign8block_14_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_14_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_14_depthwise/depthwise_kernel:0*block_14_depthwise/depthwise_kernel/Assign9block_14_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_14_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_14_depthwise_BN/gamma:0"block_14_depthwise_BN/gamma/Assign1block_14_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_14_depthwise_BN/gamma/Initializer/ones:08
?
block_14_depthwise_BN/beta:0!block_14_depthwise_BN/beta/Assign0block_14_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_14_depthwise_BN/beta/Initializer/zeros:08
?
#block_14_depthwise_BN/moving_mean:0(block_14_depthwise_BN/moving_mean/Assign7block_14_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_14_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_14_depthwise_BN/moving_variance:0,block_14_depthwise_BN/moving_variance/Assign;block_14_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_14_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_14_project/kernel:0block_14_project/kernel/Assign-block_14_project/kernel/Read/ReadVariableOp:0(24block_14_project/kernel/Initializer/random_uniform:08
?
block_14_project_BN/gamma:0 block_14_project_BN/gamma/Assign/block_14_project_BN/gamma/Read/ReadVariableOp:0(2,block_14_project_BN/gamma/Initializer/ones:08
?
block_14_project_BN/beta:0block_14_project_BN/beta/Assign.block_14_project_BN/beta/Read/ReadVariableOp:0(2,block_14_project_BN/beta/Initializer/zeros:08
?
!block_14_project_BN/moving_mean:0&block_14_project_BN/moving_mean/Assign5block_14_project_BN/moving_mean/Read/ReadVariableOp:0(23block_14_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_14_project_BN/moving_variance:0*block_14_project_BN/moving_variance/Assign9block_14_project_BN/moving_variance/Read/ReadVariableOp:0(26block_14_project_BN/moving_variance/Initializer/ones:0@H
?
block_15_expand/kernel:0block_15_expand/kernel/Assign,block_15_expand/kernel/Read/ReadVariableOp:0(23block_15_expand/kernel/Initializer/random_uniform:08
?
block_15_expand_BN/gamma:0block_15_expand_BN/gamma/Assign.block_15_expand_BN/gamma/Read/ReadVariableOp:0(2+block_15_expand_BN/gamma/Initializer/ones:08
?
block_15_expand_BN/beta:0block_15_expand_BN/beta/Assign-block_15_expand_BN/beta/Read/ReadVariableOp:0(2+block_15_expand_BN/beta/Initializer/zeros:08
?
 block_15_expand_BN/moving_mean:0%block_15_expand_BN/moving_mean/Assign4block_15_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_15_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_15_expand_BN/moving_variance:0)block_15_expand_BN/moving_variance/Assign8block_15_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_15_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_15_depthwise/depthwise_kernel:0*block_15_depthwise/depthwise_kernel/Assign9block_15_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_15_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_15_depthwise_BN/gamma:0"block_15_depthwise_BN/gamma/Assign1block_15_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_15_depthwise_BN/gamma/Initializer/ones:08
?
block_15_depthwise_BN/beta:0!block_15_depthwise_BN/beta/Assign0block_15_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_15_depthwise_BN/beta/Initializer/zeros:08
?
#block_15_depthwise_BN/moving_mean:0(block_15_depthwise_BN/moving_mean/Assign7block_15_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_15_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_15_depthwise_BN/moving_variance:0,block_15_depthwise_BN/moving_variance/Assign;block_15_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_15_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_15_project/kernel:0block_15_project/kernel/Assign-block_15_project/kernel/Read/ReadVariableOp:0(24block_15_project/kernel/Initializer/random_uniform:08
?
block_15_project_BN/gamma:0 block_15_project_BN/gamma/Assign/block_15_project_BN/gamma/Read/ReadVariableOp:0(2,block_15_project_BN/gamma/Initializer/ones:08
?
block_15_project_BN/beta:0block_15_project_BN/beta/Assign.block_15_project_BN/beta/Read/ReadVariableOp:0(2,block_15_project_BN/beta/Initializer/zeros:08
?
!block_15_project_BN/moving_mean:0&block_15_project_BN/moving_mean/Assign5block_15_project_BN/moving_mean/Read/ReadVariableOp:0(23block_15_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_15_project_BN/moving_variance:0*block_15_project_BN/moving_variance/Assign9block_15_project_BN/moving_variance/Read/ReadVariableOp:0(26block_15_project_BN/moving_variance/Initializer/ones:0@H
?
block_16_expand/kernel:0block_16_expand/kernel/Assign,block_16_expand/kernel/Read/ReadVariableOp:0(23block_16_expand/kernel/Initializer/random_uniform:08
?
block_16_expand_BN/gamma:0block_16_expand_BN/gamma/Assign.block_16_expand_BN/gamma/Read/ReadVariableOp:0(2+block_16_expand_BN/gamma/Initializer/ones:08
?
block_16_expand_BN/beta:0block_16_expand_BN/beta/Assign-block_16_expand_BN/beta/Read/ReadVariableOp:0(2+block_16_expand_BN/beta/Initializer/zeros:08
?
 block_16_expand_BN/moving_mean:0%block_16_expand_BN/moving_mean/Assign4block_16_expand_BN/moving_mean/Read/ReadVariableOp:0(22block_16_expand_BN/moving_mean/Initializer/zeros:0@H
?
$block_16_expand_BN/moving_variance:0)block_16_expand_BN/moving_variance/Assign8block_16_expand_BN/moving_variance/Read/ReadVariableOp:0(25block_16_expand_BN/moving_variance/Initializer/ones:0@H
?
%block_16_depthwise/depthwise_kernel:0*block_16_depthwise/depthwise_kernel/Assign9block_16_depthwise/depthwise_kernel/Read/ReadVariableOp:0(2@block_16_depthwise/depthwise_kernel/Initializer/random_uniform:08
?
block_16_depthwise_BN/gamma:0"block_16_depthwise_BN/gamma/Assign1block_16_depthwise_BN/gamma/Read/ReadVariableOp:0(2.block_16_depthwise_BN/gamma/Initializer/ones:08
?
block_16_depthwise_BN/beta:0!block_16_depthwise_BN/beta/Assign0block_16_depthwise_BN/beta/Read/ReadVariableOp:0(2.block_16_depthwise_BN/beta/Initializer/zeros:08
?
#block_16_depthwise_BN/moving_mean:0(block_16_depthwise_BN/moving_mean/Assign7block_16_depthwise_BN/moving_mean/Read/ReadVariableOp:0(25block_16_depthwise_BN/moving_mean/Initializer/zeros:0@H
?
'block_16_depthwise_BN/moving_variance:0,block_16_depthwise_BN/moving_variance/Assign;block_16_depthwise_BN/moving_variance/Read/ReadVariableOp:0(28block_16_depthwise_BN/moving_variance/Initializer/ones:0@H
?
block_16_project/kernel:0block_16_project/kernel/Assign-block_16_project/kernel/Read/ReadVariableOp:0(24block_16_project/kernel/Initializer/random_uniform:08
?
block_16_project_BN/gamma:0 block_16_project_BN/gamma/Assign/block_16_project_BN/gamma/Read/ReadVariableOp:0(2,block_16_project_BN/gamma/Initializer/ones:08
?
block_16_project_BN/beta:0block_16_project_BN/beta/Assign.block_16_project_BN/beta/Read/ReadVariableOp:0(2,block_16_project_BN/beta/Initializer/zeros:08
?
!block_16_project_BN/moving_mean:0&block_16_project_BN/moving_mean/Assign5block_16_project_BN/moving_mean/Read/ReadVariableOp:0(23block_16_project_BN/moving_mean/Initializer/zeros:0@H
?
%block_16_project_BN/moving_variance:0*block_16_project_BN/moving_variance/Assign9block_16_project_BN/moving_variance/Read/ReadVariableOp:0(26block_16_project_BN/moving_variance/Initializer/ones:0@H
|
Conv_1/kernel:0Conv_1/kernel/Assign#Conv_1/kernel/Read/ReadVariableOp:0(2*Conv_1/kernel/Initializer/random_uniform:08
z
Conv_1_bn/gamma:0Conv_1_bn/gamma/Assign%Conv_1_bn/gamma/Read/ReadVariableOp:0(2"Conv_1_bn/gamma/Initializer/ones:08
w
Conv_1_bn/beta:0Conv_1_bn/beta/Assign$Conv_1_bn/beta/Read/ReadVariableOp:0(2"Conv_1_bn/beta/Initializer/zeros:08
?
Conv_1_bn/moving_mean:0Conv_1_bn/moving_mean/Assign+Conv_1_bn/moving_mean/Read/ReadVariableOp:0(2)Conv_1_bn/moving_mean/Initializer/zeros:0@H
?
Conv_1_bn/moving_variance:0 Conv_1_bn/moving_variance/Assign/Conv_1_bn/moving_variance/Read/ReadVariableOp:0(2,Conv_1_bn/moving_variance/Initializer/ones:0@H
?
dense_Dense1/kernel:0dense_Dense1/kernel/Assign)dense_Dense1/kernel/Read/ReadVariableOp:0(22dense_Dense1/kernel/Initializer/truncated_normal:08
?
dense_Dense1/bias:0dense_Dense1/bias/Assign'dense_Dense1/bias/Read/ReadVariableOp:0(2%dense_Dense1/bias/Initializer/zeros:08
?
dense_Dense2/kernel:0dense_Dense2/kernel/Assign)dense_Dense2/kernel/Read/ReadVariableOp:0(22dense_Dense2/kernel/Initializer/truncated_normal:08*?
serving_default?
K
sequential_1_input5
sequential_1_input:0???????????J
sequential_3:
#sequential_3/dense_Dense2/Softmax:0?????????tensorflow/serving/predict*@
__saved_model_init_op'%
__saved_model_init_op
init_1