> Software Side-Channel Attacks - class of attacks, which primarily affecting software by trying to obtain **security critical** data via *bugs* in internal algorithm.
# Timing Attacks

> Timing attacks - are using the fact that some algorithm's execution time is **data dependent**, which can be used to obtain **hidden data**, like (keys, sertificates, etc.).

Timing attacks are made by measuring **execution latency** between the start of computational process **P** and finishing the execution. **Data dependent** algorithm will have different execution latency based on provided **input data**. Otherwise **data independent**.

Ways to measure **execution latency**:
- Computational steps (abstract, architecture dependent);
- Seconds, milliseconds, etc. (concrete, stable);
- Clock cycles (concrete, machine-oriented);

### Example 1.

```c
// Typical bubble-sort example that shows data-dependent execution latency
void bubble_sort(int *X, int n) {
	bool not_sorted;
	
	do {
		not_sorted = false;
	
		for(int i = 1; i < n; ++i) {
			if (X[i - 1] > X[i]) {
				int t = X[i - 1];
				X[i - 1] = X[i];
				X[i] = t;
				
				not_sorted = true;
			}
		}
	} while (not_sorted)
}
```

Best case scenario for *example 1.* is O(N), while worst is O(N^2). This shows that current algorithm is data-dependent, based on the values within the array *X*. Besides that, a linear execution latency increase is based on value of *n*.

#### What data can we get?

By measuring time of that algorithm with fully sorted array and array that have one unsorted element, we can get an execution latency that is equal to three operations between the inner if statement + time it takes to traverse the array once again from the very start.

This allows to predict:
- amount of unsorted elements;
- positions of unsorted elements;

## Attack model

When attacking critical parts of the system that use **secret data** we must think of the following model:

![[Screenshot_20251127_001748.png]]

Where:
- *E* is an adversary that wants to get **secret data**;
- *T* computational process or algorithm that computes r = f(k, x);
- *x* is input data that *E* provides;
- *r* is output data that *T* delivers after finishing execution;
- *k* is a **secret data** like key or other security critical data that *T* must cover;
- *A* execution time measured by *E*;

Example below shows a computational process *T* that computes b = pwd_match(G, size), and uses **secret password** *P* that it shall cover.
### Example 2.
```c
const char *P = "password_can_be_obtained_fast_even_though_long123";
const size_t P_LEN = sizeof(P);

// Example of data-dependent naive password matching algorithm.
bool pwd_match(char *G, size_t size) {
	if (size != P_LEN)    // Very easy to find P_LEN
		return false;
		
	for (int i = 0; i < P_LEN; ++i)
		if (P(i) != G(i)) // Instant stop when getting wrong character
			return false;
	
	return true;
}
```

Timing attack can easily be used on such algorithm, because it's execution time is very data-dependent. The below attack shows how to obtain a whole password using least amount of times needed to call function *pwd_match*, by assuming only the following:
- `Assuming that password P can only hold valid ascii values.`
#### Attack Algorithm 1:
- Provide strings G = {"a", "aa", "aaa", "aaaa" ...}, where amount of characters is incrementing until **execution time won't be slower**. This would mean that we have passed the first *if* statement and properly found *P_LEN*.
- Brute-force the first letter until **execution time won't be slower**, (i.e *size = 4*, G = {"aaaa", "baaa", "caaa"}). This would mean that we traversed forward in the loop once (first letter is right);
- Repeat the same as before for next *kth* character in the string, until the full password *P* will be revealed;

#### Comparison with classic attacks:
- *Brute-Force* (Classic full string) - requires knowledge of **P_LEN** from the start. Requires **O(A^n)** guesses and **guarantees recovery of P**.
- *Dictionary attack* - doesn't require knowledge of **P_LEN** from start. Requires **O(D)** guesses and **does not guarantee the recovery of P**.
- *Side Channel Attack* (Attack 1) - doesn't require knowledge of **P_LEN** from start. Requires **O(A * n)** guesses and **guarantees recovery of P**.

