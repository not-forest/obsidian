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

#### #ALGORITHM №1

![[Pasted image 20240710185706.png]]

> Spherical Linear interpolation (slerp) - procedure of determinatin a rotation that is partway between two given rotations. We can compute the incremental rotation, take a fraction of the angle, and compute the new rotation.

Here is how the *slerp* algorithm is defined in entropy language source code as a part of *Core* library.

```entropy
include core::primitives::Quartenion

fn Quartenion !< slerp q0: Quartenion, q1: Quartenion, a = {
	let qr = fn q -> q.wr < 0 ? -q: q << (q1 / q0);
	let θr = 2 * arctg << ||qr.vr|| / qr.wr;
	let nr = qr.vr / ||qr.vr||;
	!< q0 * (Quartenion::into << 
		{ sin << (a * θr * nr)/2; cos << (a * θr)/2) };
}
```

#### Which rotations representation is better?

- Axis/angle - the axis/angle representation is minimal,and hence does not require any additional constraints on the parameters (no need to re-normalize after each update). If angle is in degrees, it is easier to understand the pose, and also easier to express exact rotations. When the angle is in radians, the derivatives of R with reprect to w easily be computed.
- Quanternions - better if you want to keep track of a smoothly moving camera, since there is no discontinuities in the representation. Easier to interpolate between rotations and to chain rigid transformations.

## 3D to 2D projetions

#### Orthography and para-perspective

> Ortography - An orthographic projection simply drops the z component of the three-dimensional coordinate p to obtain the 2D point x:
$$
x = [I_{2x2}|0]p
$$

If we are using homogeneous coordinates, we can write:
$$
\tilde{x}=\begin{bmatrix}
	1 & 0 & 0 & 0 \\
	0 & 1 & 0 & 0 \\
	0 & 0 & 0 & 1
\end{bmatrix} \tilde{p}
$$
Orthography is an approximate model for long focal lenth (telephoto) lenses and objects, whose depth is shallow relative to their distance to the camera.
![[Pasted image 20240714175458.png]]

> Scaled Orthography - In practice, world coordinates need to be scaled to fit onto image sensor. For this reason, scaled orthography is actually more commonly used:
$$
x = [sI_{2x2}|0]p
$$

The scaling can be the same for all parts of the scene or it can be different for objects that are being modeled independently. Scaling can vary from frame to frame to estimate structure from motion.

> Para-perspective - in this model, object points are again first projected onto a local reference parallel to the image plane. However, rather than being projected onto a local reference parallel to the line of sight to the object center. This is followed by the usual projection onto the final image plane, which again amounts to a scaling. The combination of these two projections is therefore affine and can be written as:
$$
\tilde{x}=\begin{bmatrix}
	a_{00} & a_{01} & a_{02} & a_{03} \\
	a_{10} & a_{11} & a_{12} & a_{13} \\
	0 & 0 & 0 & 1
\end{bmatrix} \tilde{p}
$$

Para-perspective provides a more accurate projection model than scaled orthography, without incurring the added complexity of per-pixel perspective division, which invalidates traditional factorization methods.

> Perspective - most commonly used projection in computer graphics and computer vision is true 3D perspective. Here, points are projected onto the image plane by dividing them by their z component:
$$
\tilde{x} = P_z(p)=
\begin{bmatrix}
	x/z \\
	y/z \\
	1
\end{bmatrix}
$$
  In homogeneous coordinates, the projection has a simple linear form:
$$
\tilde{x}=\begin{bmatrix}
	1 & 0 & 0 & 0 \\
	0 & 1 & 0 & 0 \\
	0 & 0 & 1 & 0
\end{bmatrix} \tilde{p}
$$

After projection it is not possible to recover the distance of the 3D point from the image, which makes sense for a 2D imaging sensor.

> Two-step Projection - common in computer graphics systems, which is a two-step projection that first projects 3D coordinates into *normalized device coordinates* (x, y, z) E [-1,1]x[-1,1]x[0,1], and then rescales these coordinates to integer pixel coordinates using a viewport tranformation. The initial prespective projection is then represented using a 4x4 matrix:
$$
\tilde{x}=\begin{bmatrix}
	1 & 0 & 0 & 0 \\
	0 & 1 & -z_{far}/z_{range} & z_{near}z_{far}/z_{range} \\
	0 & 0 & 1 & 0
\end{bmatrix} \tilde{p}
$$
#### Camera Intrinsics
![[Pasted image 20240714181356.png]]

Once we have projected a 3D point through an ideal pinhole using a projection matrix, we must still transform the resulting coordinates according to the pixel sensor spacing and the relative position of the sensor plane to the origin.

> Image Sensors - image sensors return pixel value by integer *pixel coordinates $(x_s,y_s)$*, often with the coordinates starting at the upper-left corner of the image and moving down to the right.

To map pixel centers to 3D coordinates, we first scale the $(x_s,y_s)$ values by the pixel spacings $(s_x, s_y)$ [sometimes expressed in microns for solid-state sensors] and then describe the orientation of the sensor array relative to the camera projection center $O_c$ with an origin $c$ and a 3D rotation $R_s$:
$$
p = [R_s\space c_S]
\begin{bmatrix}
	s_x & 0 & 0 \\
	0 & s_y & 0 \\
	0 & 0 & 0 \\
	0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
	x_s \\ y_s \\ 1
\end{bmatrix} = M_s\tilde{x}_s
$$
The relation between the 3D pixel center $p$ and the 3D camera-centered point $p_c$ is given by an unknown scaling $s$. $p = sp_c$. We can therefore write the complete projection between $p_c$ and a homogeneous version of the pixel address $\tilde{x}_s$, as: 
$$
\tilde{x}_s = \alpha M_s^{-1}p_c = Kp_c
$$
> Calibration Matrix (K) - describes the camera *intrinsics* ( as opposed to the camera's orientation in space, which are called the *extrinsics*).

 When calibrating a camera based on external 3D points or other measurements, we end up estimating the intrinsic (K) and extrinsic (R, t) camera parameters simultaneously using a series of measurements,
$$
 \tilde{x}_s = K*[R\space t]p_w = Pp_w
$$
where $p_w$ are known 3D world coordinates and P is known as a *camera matrix.*![[Pasted image 20240716193804.png]]

> There are several ways to write the upper-triangular form of K. One possibility is:
$$
K = \begin{bmatrix}
	f_x & s & c_x \\
	0 & f_y & c_y \\
	0 & 0 & 1	
\end{bmatrix}
$$
  which uses independent focal lengths $f_x, f_y$ for the sensor x and y dimensions. The entry s encodes any possible *skew* between the sensor axes due to the sensor not being mounted perpendicular to the optical axis and $c_x, c_y$ denotes the *image center/principal point* expressed in pixel coordinates.
  Another possibility is:
$$
  K = \begin{bmatrix}
	f & s & c_x \\
	0 & \alpha f & c_y \\
	0 & 0 & 1	
\end{bmatrix}
$$
  where $\alpha$ is the *aspect ratio* has been made explicit and a common focal length $f$ is used. In practice, for many applications an even simpler form can be obtained by setting $\alpha = 1$ and $s = 0$:
$$
  K = \begin{bmatrix}
	f & 0 & c_x \\
	0 & f & c_y \\
	0 & 0 & 1	
  \end{bmatrix}
$$
  often, setting the origin at roughly the center of the image, e.g ($c_x,c_y$) = (W/2,H/2), can result in a perfectly usable camera model with a single unknown $f$.
![[Pasted image 20240716194536.png]]

#### A Note of Focal Length

Focal length sometimes causes troubles when implementing computer vision algorithms, because they are dependent on the unit used to measure pixels.

> Overall formulas below illustrate the relationship between the focal length $f$, the sensor width W and the horizontal field of view $\theta_H$:
$$
tg\frac{\theta_H}{2}=\frac{W}{2f},\space or \space f = \frac{W}{2}arctg\frac{\theta_H}{2}
$$

For example the stock lens that often comes with SLR cameras is 50mm, therefore the focal length would also be interpreted in mm. Since we work with digital images, it is more convenient to express W in pixels, so that the focal length $f$ can be used directly in the calibration matrix K.

> Independent Focal Lengths - can be obtained by scaling the pixel coordinates that go from [-1, 1) along the longer image dimension and 
> 				  $-\alpha^{-1},\alpha^{-1}$
> along shorter axis, where $a >= 1$ is the image aspect ratio (as opposed to the sensor cell aspect ratio above). This can be obtained using *normalized device coordinates*
$$
x'_s = (2x_s - W) / S\space and\space y'_s = (2y_s - W) / S\space where\space S = max(W,H)
$$
  This is useful in multi-resolution, image-processing algorithms, such as image pyramids.

#### Camera Matrix

Above there is an information about how to parametrize the calibration matrix K, we can put the camera *intrinsics* and *extrinsics* together to obtain a single 3x4 *camera matrix*
$$
P = K[R\space t]
$$

![[Pasted image 20240716201548.png]]