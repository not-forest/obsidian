> **Microarchitectural Attacks** - attacks dedicated to certain parts of microprocessor like caches, out-of-order execution, etc. to obtain some leaked **security information** as a side channel.

## Processor Caches as a Side-Channel.

Caches are small bancks f memory within the processor architecture, which are used to increase overall throughput of the system by storing data that was recently used, assuming that they would be used again. 

By controling internal caches, the adversary can obtain secured information as a side channel (**secret-dependent memory accesses**), by using following features of modern caches:
- When *cache line* contains proper *address* that CPU tries to use again, this is considered as a **cache hit** and the overall execution time will be much **faster**;
- Meanwhile **cache miss** will provide **slower** execution time;
- Because caches don't have infinite size, some of them must be **evicted** when overflown. Adversary can use the fact that most caches use **least recently used (RLU)** replacement policy for cache lines;
- Caches of different levels have **different** access time, though also leaking information via time measurement;
- Some caches are **local to CPU** in multiprocessor systems. The **last level cache (LLC)** is usually unified between all CPUs;
- When cache line is evicted from LLC, it **shall also be evicted from L2 and L1 caches**;

> **Prime+Probe Attack** - attack that uses processor caches as a side channel to **leak** secured data. This attack assumes, the attacker utilizes the same processor resources as the attacked system.

Prime+Probe Attack consists of two main stages:
1. Adversary **completely fills** on or more sets of the cache with it's own data. He then waits for the victim the opportunity to run and access memory;
2. **Measures time** it takes to access the data it previously used for filling the cache;
If the victim **access** memory, which is mapped to any of the cache sets that the adversary used for the attack, victim will cause caches to **evict some of the attacker's data**. This will cause access to that data during the *probe* stage to be slower than to non-evicted lines, allowing the adversary to **identify cache sets that the victim has accessed**.

### Example. Prime+Probe on L1 cache.

Consider a single-core processor with L1 cache of the following characteristics:
- contains **64** sets;
- each set contains **8** cache lines;
- each line is **64 bytes long**;
#### Step One (Prime):

To prime the cache set we first have to prepare a buffer, which is both **cache-sized** and **page-aligned**. Multiplying all the above we obtain:
> 64 *sets* * 8 *lines*  * 64 *bytes* = 32768 *bytes* = 32 *KB* of size.

Usually such attacks are only possible on systems, where the adversary has access to the system running the program it wants to attack. Therefore such system shall provide some sort of *operating system* and dynamic allocation system calls like **mmap**.

Given a cache set number **s** and line number **i**, each cache set from **0 <= s < 64** can have eight offsets **0 <= i < 8**, which are accessible like so: __64 * s + 4096 * i__

> **Eviction Set** - term used to define a **collection of memory locations** that completely **cover** a cache set.

Last step for priming a cache set is to use the **eviction set** prepared before and just **access** contents of each **cache line (8 memory locations in this example)**.

#### Step Two (Probe)

This step requires to access the same cache lines simply by reading them, but also measuring time it takes for that operation. The *naive* approach won't work due to the **out-of-order** execution, therefore a set of additional features must be utilized to properly measure time:
- Using a **fence** instruction (different for different architectures), that ensures that no younger instruction starts before older onces after the fence;
- To prevent wrong measurement due to processor's **pipelining**, we shall make those memory reads depend on each other (*Using a linked list as an example*);

### Example. Using Prime+Probe on AES.

Implementations of AES algorithm in embedded systems utilize **T-tables** to substitude expensive *sub-bytes*, *shift-rows* and *mix-columns* operations into a simple XOR operations with a round key, that corresponds to index of one of four tables.

If victim system is using **AES-128**, which demands **10** rounds, where each table is accessed **4** times, we get that each table is accessed in total of **40** times during the whole encryption of one block.

Therefore the attack is performed as followed:
1. Adversary **primes all cache sets** in L1 cache;
2. Performing one full AES encryption with a **known plaintext**;
3. Adversary performs a **probing** step, trying to identify the cache sets accessed by the victim.

> **Attack Resolution** - resolution of side-channel attacks during **probing** step.

The Prime+Probe attack has a **one line** resolution. This means that the adversary won't be able to define which **index was accessed within one cache line**. Which means that it can only determine **four MSB** of the accessed index.

![[IMGS/Screenshot_20251206_172334.jpg]]

The remaining bits shall be guested and concluded in the next rounds of the attack. The resolution doesn't allow to get the result right away, therefore they can be deduces by redoing this attack with another plaintext or using other types of attacks.

### Example: Prime+Probe on LLC

Cross-core attacks are not possible with L1 caches. Targeting LLC cache allows such atack, but requires more effort. Reason for this is **virtual memory**, which will cause different addressing on LLC caches, since they are much larger than L1 caches.

> **Witness Set** - set of cache lines that we accesed before, therefore know that it is within the LLC cache.

To attack LLC cache, an additional step must be done to chose several *witness* memory locations and then observe which of those addresses were **evicted** during victim's runtime. This allows to shrink the address values to a set that we know is going to be an **eviction set** for the real attack.

#### Note! This attack only works if LLC cache is **inclusive**. Non-inclusive LLC does not evict L2 and L1 caches, therefore gives no information from witness set.

> **Prime+Abort** - legacy attack used on older Intel x86 processors, that included **Intel Transactional Synchronization Extensions (TSX)**. Does not rely on timings, since transaction operation aborts every time the victim evicts the cache set. *This extension is disabled in newest processors due to that security reason.*

> **Prime+Scope** - uses the interplay between L1 and LLC caches to **improve attack measuremet resolution**. 

When line is evicted from inclusive LLC cache, it is **also** evicted from adversary's L1 cache. Instead of accessing LLC eviction set in random order, a **specific patern is used**, so that the LLC replacement candidate is also cached in **attacker's L1 cache**.

When victim evicts cache lines from LLC, it also evicts lines from **attacker's L1 cache**, therefore a cache miss is in **all cache levels** and causes much longer access times. All cache hits however are extremely fast, since they are in L1 cache. This type of attack allows to measure delays much easier, even with higher noise ratio.

> **Cache Occupancy Attack** - instead of targeting specific cache sets, measures the cache as a whole by **allocating a cache-sized buffer in memory** and repeatedly measures the access time to all of cache lines in this buffer.

Each such measurement brings the whole buffer to the cache, therefore **time to access the buffer** corellates with **amount of lines evicted from cache.** Each measurements takes hundreds/thousands of microseconds, therefore **attack measurement resolution** is even worse than in regular Prime+Probe.

#### **Cache Occupancy Attack** does not give any information about what addresses the victim accesses, but only about how many lines is evicted.

Such attack is usually used not to obtain a secret data, but rather to detect running applications and their intentions. Low attack measurement resolution allows it to be used in environments with *slow clocks*, like network latency. Futhermore it does not require to **know the structure of the cache**, therefore works with any type of cache, even **secured ones**.

> **Flush+Reload Attack** - uses the fact that OSes **share** memory between processes (shared libraries or forked code) and uses this fact to measure which cache lines were **reloaded** by the victim.

If both the adversary and the victim shares the same memory region (e.g. shared library), the adversary does the following:
1. **Evicts** shared memory cache lines (e.g. by **flushing asm instruciton**) and allows the victim to **continue executing**;
2. Measures time it takes to obtain those lines, and detecting a **cache miss** if victim **hasn't used it** or **cache hit otherwise**;

This attack is **very limited** because both the adversary and the victim must share some memory region like libraries or deduplicated pages (often disabled for security reasons e.g. in cloud). Usually such attacks are used on **shared cryptographic libraries**.

### Example. Attacking on "square-and-multiply" exponentation.

If victim uses modular exponentation, which is used in multiple encryption ciphers such as **RSA** and **ELGamal**, the adversary **flushes two memory lines within the library that impements it**, that it, it flushes the **square** and the **multiply** both.

```c
const uint8_t D = 0b10011011;

uint32_t sqandmul(uint32_t b, uint32_t m) {
	uint32_t x;
	for (int i = 0; i < 8; ++i) {
		x = pow(2, x) % m;
		if ((D >> i) & 0xFE) {
			x = x * b % m;
		}
	}
}
```

After some time victim **reloads** the line, therefore giving up information about the **chosen branch within the if statement**, which means information about a **secret exponent**.

> **Evict+Reload** - variant of Flush+Reload attack for **non x86 targets**, where flushing instruction does not exist or is *privileged*. Eviction sets like in Prime+Probe attacks are used to evist those lines without flush instruction.

> **Flush+Flush** - variant of Flush+Reload attack for **x86 targets** that abuses the fact that **time to reflush the cache line** depends a lot of whether this line is in cache or not. This type of attack has higher **time measurement resolution**, therefore allowing to measure with higher frequencees. Attack is **noisier** than Flush+Reload.

## Performance Degradation Attacks

> **Performance Degradation Attack** - used alongside other attacks to decrease the performance of victim, therefore allowing the adversary to perform other attacks more **consistently**

Since most of microarchitectural cache-related attacks requires to **control victims execution**, the attacker can **flush** victim's code from the cache, therefore slowing down it's execution. This sometimes is mandatory to even perform one of above mentioned attacks.

## Attacks on Instruction Caches

Attacking instruction caches allows to reveal **secret-dependent control flow** rather than **secret-dependent memory accesses**. For **Prime+Probe** attacks on instruction caches, the adversary has to **execute code in the eviction set** rather than just accessing it.

Consider the following code to *prime* the instruction cache in L1 cache of x86 architecture.

```asm
	.align 4096
L1InstructionProbe:
P1:
	rdtscp
	mov %rax, %rsi
	jmp P2
	.align 4096
P2:
	jmp P3
P3:
	jmp P4
P4:
	jmp P5
P5:
	jmp P6
P6:
	jmp P7
P7:
	jmp P8
P8:
	rdtscp
	sub %rsi, %rax
	ret
```

Each jump is aligned on page-boundary. after visiting all those addresses (executing this function), the whole 64 cache sets are primed.

## Covert Channels

> **Covert Channel** - channels that leak secret information by **exploiting microarchitectural components**, by creating a pair: **transmitter (Trojan)** and a **receiver**. The information is therefore leaked via medium that is not desiged for communication.

### Example. Cache-based Flush+Reload Covert Channel

The example below implements a way for **two separate programs** to send a single **byte** of data, via a covert channel.

```c
uint8_t probe_array[256 * 4096] = {1};

/* Flushes all cache sets within the shared region. */
void cc_setup() {
	for (int i = 0; i < 256; ++i)
		__flush(probe_array + i * 4096);
	__mfence();
}

/* Forces the cache to reload reproducing all bits within the byte. */
void cc_transmit(uint8_t byte) {
	if (byte < 0)
		return;
	volatile uint8_t *ptr = probe_arr + byte * 4096;
	uint8_t t = *ptr;
}

/* Returns the byte via covered channel, or -1 when unable to do it. */
uint8_t cc_receive() {
	int junk = 0;
	__mfence();
	
	for (int i = 0; i < 256; ++i) {
		volatile uint8_t *ptr = probe_array + i * 4096;
		uint64_t start = __rdtscp(&junk);
		uint8_t v = *ptr;
		uint64_t latency = __rdtscp(&junk) - start;
		
		if (latency < THRESHOLD)
			return i;
	}
	return -1
}
```

## Transient-execution Attacks

> **Transient-Execution Attacks** - term for forcing the CPU to execute instructions, only to squash them later when discovering they are not part of nominal program execution. It exploits **out-of-order** and **speculative** execution.

> **Spectre Attack** - exploits transient-execution caused by **branch misprediction**. Attacks trains the **branch predictor** to execute the same branch, until forcing it to **mispredict** while executing completely unallowed one.

### Example: Spectre Attack for out of bounds data.

Imagine a **victim** function that checks the index within some shared array. If the index is within bounds of that array, it returns **value on that index**, otherwise returns *-1*.

```c
const size_t ARRAY_LEN = 1000;
static uint8_t ARRAY[ARRAY_LEN] = { .... };

/* Returns value at index of array if in bounds. */
int victim(uint64_t index) {
	if (index >= ARRAY_LEN)
		return -1;
	return ARRAY[index;]
}

/* Victim wrapper for training the branch predictor. */
int victim_wrapper(uint64_t index) {
	for (int i = 0; i < 128; i++);
	return victim(index);
}

/* Trains branch predictor and gets some value out of bounds via covert channel. */
int spectre(uint64_t index) {
	volatile int junk = 0;    // Prevents optimization.
	junk = victim_wrapper(0);
	junk = victim_wrapper(0);
	junk = victim_wrapper(0);
	
	cc_setup();
	
	__clflush(&array_len);
	__mfence();
	int rv = victim_wrapper(index);
	cc_transmit(rv);
	
	return cc_receive();
}
```

Here we train the branch predictor with **victim_wrapper**, then creating a covert channel to transmit a byte, which is out of bounds from the array we accesing. We flush the `array_len` value from the cache, to force the branch predictor to predict the output without it (it will do it for system speedup). Branch predictor **misspredicts** and returns value located at any index we provide, thus accesing any data within victims address space.

Eventually CPU retrieves the `array_len` and calculates that branch was wrong, it tries to **terminate speculative execution**, and proceeds with correct path (returning -1), however at this stage the retrieved value is already **transmitted via covert channel**. This allows to access any address in victim's memory via such attack byte-by-byte.

> **Meltdown Attacks** - exploit the fact that code **younger instructions** may execute even after a **trap**, therefore allowing the attacker to access **protected kernel memory** from **user-space**.


