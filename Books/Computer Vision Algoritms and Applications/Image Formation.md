## 2.1 Geometric Primitives and Transformation
![[Pasted image 20240703200457.png]]

Before we can analyze and manipulate images, we need to establish a vocabulary for describing the geometry of a scene, like the image formation process that produced a particular image given a set of lightning conditions, scene geometry, surface properties, and camera optics.

Geometric primitives are basic building blocks used to describe three-dimensional shapes.

> Origin - place where all X, Y and eventually Z coordinates intersect.

> 2D Point - can be denoted just by using a pair of values X = (x, y) E R$^2$.
> ![[Pasted image 20240703201732.png]]

2D points can also be represented using *homogenous coordinates*: $\tilde{x} = (\tilde{x}, \tilde{y}, \tilde{w})$ E P$^2$, where vectors that differ only by scale are considered to be equivalent. P$^2$ = R$^3$ - (0, 0, 0) is called the *2D projective space*.

A homogeneous vector $x$ can be converted back into an inhomogenous vector X by dividing through by the last element $w$.
$$
\tilde{x} = (\tilde{x}, \tilde{y}, \tilde{w}) = \tilde{w}(x,y, 1) = \tilde{w}\overline{x}  
$$
> Augmented Vector: $\overline{x} = (x, y, 1)$ is the *augmented vector* Homogeneous points whole last element is w = 0 are called *ideal points* or *points at infinity* and do not have an equivalent inhomogeneous representation.

> 2D Lines can also be represented using homogeneous coorditanes $l = (a, b, c)$. The corresponding line equation is:
$$
\overline{x}*\tilde{l} = ax + by + c = 0
$$

We can normalize the line equation vector so that $l = (\hat{n}_x, \hat{n}_y, d) = (\hat{n}, d), with ||\hat{n}|| = 1$. n is the normal vector perpendicular to the line and d is the distance to the origin. (Exception to this normalization is the line infinity l = (0, 0, 1), which includes all ideal points at infinity).

![[Pasted image 20240703205056.png]]

We can also express $\hat{n}$ as a function of rotation angle $\theta, \hat{n} = (\hat{n}_x, \hat{n}_y) = (cos\theta, sin\theta)$. This representation is commonly used in the *Hough transform line-finding algorithm*.

> Polar coordinates - a combination of ($\theta, d$).

#### Why homogeneous coordinates

>When using homogeneous coordinates, we can compute the intersection of two lines as:
$$
\tilde{x} = \tilde{I}_1 \times \tilde{I}_2
$$
 Similarly, the line joining two points can be written as:
$$
 \tilde{I} = \tilde{x}_1 + \tilde{x}_2
$$
> 2D Conics - conic sections that can be expressed with homogeneous equations like so:
$$
 \tilde{x}^TQ\tilde{x}=0
$$

Quadric equations play useful roles in the study of multi-view geometry and camera calibration (Hartley and Zisserman 2004; Fraugeras and Luong 2001).

> 3D points - in the same way can be written using inhomogeneous coordinates $x = (x, y, z)$ E R$^3$ or homogeneous coordinates $\tilde{x} = (\tilde{x}, \tilde{y}, \tilde{z}, \tilde{w})$ E P$^3$. As before it is sometimes useful to denote a 3D point using the augmented vector $\overline{x} = (x, y, z, 1)$ with $\tilde{x} = \hat{w}\overline{x}$.

![[Pasted image 20240704183428.png]]

> 3D Planes - can also be represented as a homogeneous coordinates $\tilde{m} = (\hat{n}_x, \hat{n}_y, \hat{n}_z, d) = (\hat{n}, d)$ with $||\hat{n}|| = 1$. In this case $\hat{n}$ is the normal vector perpendicular to the plane and d is its distance to the origin. The same way: the plane at infinity $\tilde{m} = (0, 0, 0, 1)$.

> We can express $\hat{n}$ as a function of two angles $(\theta, \phi)$.
$$
> \hat{n} = (cos\theta cos\phi, sin\theta cos\phi, sin\phi);
$$
 i.e using spherical coordinates. These are less commonly used than polar coordinates since they do not uniformly sample the space of possible normal vectors.

Lines in 3D are less elegant that either lines in 2D or planes in 3D. One possible representation is to use two points on the line, (p, q). Any other point on the line can be expressed as a linear combination of these two points:
$$
r = (1 - \lambda)p + \lambda q
$$
If we restrict $0 <= \lambda <= 1$, we get the *line segment* joining p and q. With homogeneous coordinates, we can write the line as:
$$
\tilde{r} = \mu \tilde{p} + \lambda\hat{q}
$$

A special case if when the second point of infinity, i.e, $\tilde{q} = (\tilde{d}_x, \tilde{d}_y, \tilde{d}_z, 0) = (\hat{d}, 0)$. Here, we see that $\hat{d}$ is the direction of the line. Then this can be rewritten as:
$$
r = p + \lambda\hat{d}
$$
#### Disadvantage of the Endpoint Representation

Too many degrees of freedom: 6, because 3 values describe one end point.

> Four-point parameterization - A solution to this is to fix two points on the line, to lie in specific planes, we obtain a representation of 4 degrees of freedom.

> Two-Plane Parameterization - This method is used in some image-based rendering systems, like the light field and Lumigraph, to represent the rays seen by a camera moving in front of an object. The two-endpoint representation is also useful for representing line segments, even when their exact endpoints cannot be seen (only guessed at).

> Plücker Coordinates - to represent all possible lines without favoring any particular direction or orientation, we use Plücker coordinates. This method provides a more generalized and unbiased way of representing lines in 3D space. These coordinates are the six independent non-zero entries in the 4x4 skew symmetric matrix
$$
 L = \tilde{p}\tilde{q}^T - \tilde{q}\tilde{p}^T
$$
 where \tilde{p} and \tilde{q} are any two (non-identical) points on the line. This representation has only four degrees of freedom, since L is homogeneous and also satisfies |L| = 0, which results in a quadratic contraint on the Plücker coordinates.

> 3D Quadtics - the 3d analog of a conic section is a quadric surface:
 $$
 \overline{x}^TQ\overline{x}=0
$$
---
## 2.1.1 2D Transformations

![[Pasted image 20240704192309.png]]

> Translation - a simple 2D translations can be written as:
$$
	x' = x + t
$$
  or:
$$
  x' = \begin{bmatrix}
	I & t
	\end{bmatrix}\overline{x}
	=
	\begin{bmatrix}
	1 & 0 & t_x \\
	0 & 1 & t_y
	\end{bmatrix}

$$
  or:
$$
  x' = \begin{bmatrix}
	I & t \\
	O^T & 1
	\end{bmatrix}\overline{x} 
	=
	\begin{bmatrix}
	1 & 0 & t_x \\
	0 & 1 & t_y \\
	0 & 0 & 1
	\end{bmatrix}\overline{x} 

$$
  Where I is the 2x2 identity matrix and O is the zero vector and t is a translation vector. Using 2x3 matrix results in a more compact notation, whereas using a full-rank 3x3 matrix makes it possible to chain transformations using matrix multiplication as well as to compute inverse transforms.

> Rotation - a simple 2D rotation can be written as:
> $$
> x' = Rx
  $$
  or:
$$
  x' = \begin{bmatrix}
	R & O
	\end{bmatrix}\overline{x}
	=
	\begin{bmatrix}
	cos\theta & -sin\theta & 0 \\
	sin\theta & cos\theta & 0
	\end{bmatrix}\overline{x}

$$
  or:
$$
  x' = \begin{bmatrix}
	R & O \\
	O^T & 1
	\end{bmatrix}\overline{x}
	=
	\begin{bmatrix}
	cos\theta & -sin\theta & 0 \\
	sin\theta & cos\theta & 0 \\
	0 & 0 & 1
	\end{bmatrix}\overline{x}

$$
 where R is an orthonormal rotation matrix

> Rotation + translation - a combination of both translation and rotation also known as *2D rigid body motion* or *2D Eclidian transformation*:
$$
x' = Rx + t
$$
  or:
$$
  x' = \begin{bmatrix}
	R & t
	\end{bmatrix}\overline{x}
	=
	\begin{bmatrix}
	cos\theta & -sin\theta & t_x \\
	sin\theta & cos\theta & t_y
	\end{bmatrix}\overline{x}

$$
  or:
$$
  x' = \begin{bmatrix}
	R & t \\
	O^T & 1
	\end{bmatrix}\overline{x}
	=
	\begin{bmatrix}
	cos\theta & -sin\theta & t_x \\
	sin\theta & cos\theta & t_y \\
	0 & 0 & 1
	\end{bmatrix}\overline{x}

$$
> Scaled rotation - also known as the similarity transform:
$$
x' = sRx + t
$$
  where s is an arbitrary scale factor (matrix):
$$
  x' = \begin{bmatrix}
	  sR & t
  \end{bmatrix}\overline{x}
  =
  \begin{bmatrix}
	a*cos\theta & -b*sin\theta & t_x \\
	b*sin\theta & a*cos\theta & t_y
	\end{bmatrix}\overline{x}
$$
> Affine Transformation - a transformation written as so:
$$
x' = A\overline{x}
$$  where A is an arbitraty 2x3 matrix, i.e:
$$
x' = \begin{bmatrix}
	a_{00} & a_{01} & a_{02} \\
	a_{10} & a_{11} & a_{12}
\end{bmatrix}\overline{x}
$$
> Projective - this transformation, also known as a perspective transform or homography, operates on homogeneous coordinates.
$$
\tilde{x}'=\tilde{H}\tilde{x}.
$$
Where $\tilde{H}$ is an arbitrary 3x3 matrix. Note that it is homogeneous. The resulting $\tilde{x}'$ must be normalized in order to obtain an inhomogenous result x, i.e:
$$
x' = \frac{h_{00}x + h_{01}y + h_{02}}
		  {h_{20}x + h_{21}y + h_{22}} and
y' = \frac{h_{10}x + h_{11}y + h_{12}}
		  {h_{20}x + h_{21}y + h_{22}} 
$$
![[Pasted image 20240704210914.png]]

> Co-Vectors - several vectors that used to describe lines can be transformed in the same way as ones above.
$$
\tilde{l}'\tilde{x}'=\tilde{l}'\tilde{H}\tilde{x}=(\tilde{H}^T\tilde{l}')^T\tilde{x}=\tilde{l}\tilde{x}=0
$$
> Stretch/squash - a restricted from of an affine transformation, where the aspect ratio is changed, because each scalar value is different.
$$
x' = s_xx + t_x
$$
$$
y' = s_yy + t_y
$$
> Planar surface flow (Horn 1986; Bergen, Anandan et al. 1992; Girod, Greiner, and Niemann 2000) - this eight-parameter transformation arises when a planar surface undergoes a small 3D motion. It can thus be thought of as a small motion approximation to a full homography.

$$
x' = a_0 + a_1x + a_2y + a_6x^2 + a_7xy
$$
$$
y' = a_3 + a_4x + a_5y + a_6xy + a_7y^2
$$
> Bilinear interpolant (Wolberg 1990) = this eight-parameter transform can be used to interpolate the deformation due to the motion of the four corner points in square. Often useful in the interpolation of sparse grids using splines. Does not preserve straight lines.
$$
x' = a_0 + a_1x + a_2y + a_6xy
$$
$$
y' = a_3 + a_4x + a_5y + a_7xy
$$
## 2.1.2 3D Transformations

The set of three-dimensional coordinate transformations is very similar to that available for 2D transformations.
![[Pasted image 20240704221115.png]]

> Translation - 3D translation can be written as:
$$
x' = x + t
$$
  where I is the identity 3x3 matrix this time.

> Rotation + Translation - also known as *3D rigid body motion* or the *3D Euclidean transformation*, it can be written as:
$$
x' = Rx + t
$$
  where R is a 3x3 orthonormal matrix. Often it is more convenient to describe a 3D rigid motion using:
$$
x' = R(x - c) = Rx - Rc
$$
  where c is the center of rotation (often camera center).

---

#### Proper 3D Rotation

Compactly parameterizing a 3D rotation is a non-trivial task, which we describe in more detail below.

> Scaled Rotation - similar to the 2D one:
$$
x' = sRx + t
$$
  where s is an arbitrary scale factor (matrix):
$$
  x' = \begin{bmatrix}
	  sR & t
  \end{bmatrix}\overline{x}
$$
> Affine Transform - is written as:
$$
x' = A\overline{x} = \begin{bmatrix}
	a_{00} & a_{01} & a_{02} & a_{03} \\
	a_{10} & a_{11} & a_{12} & a_{13} \\
	a_{20} & a_{21} & a_{22} & a_{23}
\end{bmatrix}\overline{x}
$$
Parallel lines and planes remain parallel under affine transformations.

> Projective - this transformation, variously known as a 3D perspective transform, homography, or collineation, operates on homogeneous coordinates.
$$
\tilde{x}' = \tilde{H}\tilde{x}
$$
  where $\tilde{H}$ is an arbitrary 4x4 homogeneous matrix. The result must be normalized in the same way as in 2D version.

## 2.1.3 3D Rotations

In 3D rotation the R matrix is not straightforward, as several possibilities exist.

> Euler angles - a rotation matrix formed as the product of three rotations around three cardinal axes. This is a bad idea -> as the result depends on the order in which the transforms are applied.

> Axis/angle (exponential twist) - a rotation can be represented by a rotation axis $\hat{n}$ and an angle $\theta$

![[Pasted image 20240704234539.png]]
![[Pasted image 20240704235334.png]]
![[Pasted image 20240704235423.png]]
![[Pasted image 20240705000022.png]]

> Rodrigues' Formula - defines the rotational matrix R with the use of rotation axis $\hat{n}$ and an angle $\theta$
$$
R(\hat{n}, \theta) = I + sin\theta[\hat{n}]_\times + (1 - cos\theta)[\hat{n}]^2_\times
$$
Rotations through common angles such as multiples of 90$^o$ can be represented exactly (and converted to exact matrixes) if $\theta$ is stored in degrees.
#### Where to use
> Excellent choice for small rotations (e.g corrections to rotations)
![[Pasted image 20240705001959.png]]

> Unit Quaternions - the unit quaternion representation is closely related to the angle/axis representation. It is a unit, length 4-vector whose components can be written as $q = (q_x, q_y, q_z, q_w)$. Those components live on a unit square $||q|| = 1$ and *antipodal* (opposite sign) quatenions, q and -q representation of a rotation is unique.
  Popular for pose representation and pose interpolation in computer graphics.

![[Pasted image 20240705003026.png]]

This representation is continuous, i.e, as rotation matrices vary continuously, you can find a continuous quaternion representation.

Quaternions can be derived from the axis/angle representation through the formula:
$$
q = (v,w) = (sin\frac{\theta}{2}\hat{n},cos\frac{\theta}{2}),
$$
![[Pasted image 20240710183623.png]]

> Given two queternions $q_0 = (v_0, w_0)$ and $q_1 = (v_1, w_1)$, the quartenion multiply operator is defined as:
$$
q_2 = q_0q_1 = (v_0 \times x_1 + w_0v_1 + w_1v_0, w_0w_1-v_0 \cdot v_1)
$$
 therefore arrives the property:
$$
 R(q_2) = R(q_0)R(q_1)
$$
> NOTE! Quartenion multiplication, as well as 3D rotation and matrix multiplication are not commutative.

> The Inverse of Quaterion can be obtained by flipping the sign of either $v$ or $w$ but not both.

---

#### #ALGORITHM 2.1

![[Pasted image 20240710185706.png]]

> Spherical Linear interpolation (slerp) - procedure of determinatin a rotation that is partway between two given rotations. We can compute the incremental rotation, take a fraction of the angle, and compute the new rotation.

Here is how the *slerp* algorithm is defined in entropy language source code as a part of *Core* library.

```entropy
include core::primitives::Quartenion

fn Quartenion !< slerp q0: Quartenion, q1: Quartenion, a = {
	let qr = fn q -> q.wr < 0 ? -q:  q << (q1 / q0);
	let θr = 2 * arctg << ||qr.vr|| / qr.wr;
	let nr = qr.vr / ||qr.vr||;
	!< q0 * (Quartenion::from << 
		(sin << (a * θr * nr)/2, cos << (a * θr)/2));
}
```

