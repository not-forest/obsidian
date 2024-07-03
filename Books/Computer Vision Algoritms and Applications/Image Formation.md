## 2.1 Geometric Primitives and Transformation
![[Pasted image 20240703200457.png]]

Before we can analyze and manipulate images, we need to establish a vocabulary for describing the geometry of a scene, like the image formation process that produced a particular image given a set of lightning conditions, scene geometry, surface properties, and camera optics.

Geometric primitives are basic building blocks used to describe three-dimensional shapes.

> Origin - place where all X, Y and eventually Z coordinates intersect.

> 2D Point - can be denoted just by using a pair of values X = (x, y) E R$^2$.
> ![[Pasted image 20240703201732.png]]

2D points can also be represented using *homogenous coordinates*: $x = (x, y, w)$ E P$^2$, where vectors that differ only by scale are considered to be equivalent. P$^2$ = R$^3$ - (0, 0, 0) is called the *2D projective space*.

A homogeneous vector $x$ can be converted back into an inhomogenous vector X by dividing through by the last element $w$.
$$
x = (x, y, w) = w(x,y, 1) = wx  
$$
where x = (x, y, 1) is the *augmented vector* Homogeneous points whole last element is w = 0 are called *ideal points* or *points at infinity* and do not have an equivalent inhomogeneous representation.

> 2D Lines can also be represented using homogeneous coorditanes $l = (a, b, c)$. The corresponding line equation is:
$$
x*l = ax + by + c = 0
$$

We can normalize the line equation vector so that $l = (n_x, n_y, d) = (n, d), with ||n|| = 1$. n is the normal vector perpendicular to the line and d is the distance to the origin.
![[Pasted image 20240703205056.png]]

