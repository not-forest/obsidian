## Main Definitions

![[IMGS/Screenshot_20251203_000340_com.huawei.hwread.dz.jpg]]

> **Cryptology** - science of information and it's security

> **Cryptography** - science of securing **information** against an **adversary**;
> **Cryptanalysis** - science and art of *breaking* cryptosystems

> **Adversary** - someone with intentions of breaking into implemented cryptosystems for some own benefits.

Current cryptography mainly consists of  the following:
- **Symmetric Algoritms** - encryption, decryption method and a key that must be distributed via a **secured channel**;
- **Assymetric (or Public-Key) Algorithms** - completely different type of ciphers where two keys exists, where one is used for encryption and one for decryption;
- **Protocols** - combination of cryptographic primitives that produce some security function, which can be a way to store data securely or it's secure transfer over some medium;

### Channels

Communication or data transfer is done via some type of channel, which can be either secured or most of the type insecured. There could also be additional **Side-Channels**, which may leak some information by others (often unexpected) mediums, like for example *time*.

## Five Pillars of Information Assurance

> **Confidentiality** - cryptography makes sure our data cannot be understood by an adversary, even if it has full access to eavesdropping or physical access. This is done by encrypting data with a key, known only to authorized parties;
> **Integrity** - cryptography makes sure our data cannot be changed by an adversary, in a way that we won't notice. For data that is send via insecured channels, we expect to ignore it if it's internals were changed in any way to prevent risks of higher level attacks;
> **Authentication** - cryptography makes sure that we would know if the data is really coming from the user, device, authority we trust and check whether the author is who he claims to be;
> **Avalability** - cryptography makes sure that the system is always fully available to those who have authorized access;
> **Non-repudiation** - cryptography makes sure that it can prove whether a specific entity was the source of some action/data, so that it cannot deny or hide it.

## Classical Cryptanalysis

> **Brute-Force Attack** - treats the cipher as a **black box** and tries to decrypt the message by trying out all available keys, within the **key space**

Features:
- **Guarantees** to find the proper key and decrypt the message with worst case scenario of 2^|k|;
- Always possible against **symmetric ciphers** in principle, howerer the practical approach is based on **key-length**:
	- **64-bit** - only practical with data of very **short** lifetime;
	- **128-bit** - practical with all current systems for **long-term** data, however that key space is **not quantum secure** and will be easy to crack by quantum computers;
	- **256-bit** - practical with all systems for **long-term** data;


> **Frequency Analysis** - trats the cipher as a **gray-box** by trying to analyze the frequency of messages within the ciphertext. With enough statistical data, it can be compared to **relative frequencies of that system typical application**, for example if it is a messanger, we could compare it to frequencies of the language, and easily find some most-used letters.

Features:
- Do **not guarantee** to find a proper key, but has high chances in practice, when obtained enough statistical data;
- By obtaining several first parts of the key ciphers that are bad at hiding their statistical properties, it is usually easy to get the rest quicker.

### Main Classes of Attacks:
- **ciphertext-only attack** - adversary only has access to ciphertext;
- **known-plaintext attack** - in addition to ciphertext, the adversary also has access to some parts of plaintext (e.g. known headers, email data);
- **chosen-plaintext attack** - adversary have access to the system so it can check the output ciphertext based on **his own** input. This is true for physical decryption devices such as smart cards, and can lead to use of **Side-Channel Attacks**;
- **chosen-ciphertext attack** - the same as above, but uses his own ciphertexts to obtain plaintexts in some decryption algorithm;
- **adaptive chosen-plaintext** - adversary changes his plaintext based on the output ciphertext and analysis of that encryption result;
- **adaptive chosen-ciphertext** - the same as above but other way around;
- **related-key attack** - adversary obtaines key based on mathematical relations between plaintext and ciphertext;

> **Implementation Attacks** - treat the cipher as a **white-box** by knowing or partially knowing the algorithm it does, and tries to find a flaw in it's design to obtain a secret key via some **side-channel analysis**.

> **Social Engineering Attacks** - involve obtaining secret information from humans, which are unreliable most of the time. Different methods like bribing, blackmailing, tricking, fishing, espionage are used.

## Kerckhoff Principles

There are several principles, some of which may not make much sense nowadays, however some of them must be taken seriously now and in the future:
- The system should be, if not **theoretically unbreakable**, unbreakable in practice;
- The design of a system **should not require** secrecy, and compromise of the system should not inconvenience the correspondents;
- The system should be easy, neither requiring knowledge of a long list of rules nor involving mental strain.

> **Provable Security** - cryptographic hardness assumption, which is **not a mathematical proof**. Such assumptions are obtained if all bellow are true:
- algorithm has a description of a cryptographic scheme;
- there are proper capacities and goals of adversary (security model);
- mathematical proof that the proposed scheme meets the security goal, assuming that some standard cryptographic assumptions hold true;

## Advances Cryptographic Schemes

> **Homomorphic Encryption** - allows computations on ciphertext, without first decrypting. Mostly useful in cloud computing. When only some specific operations are possible on a set of encrypted data, it is considered a **partial homomorphic encrypion**

> **Multiparty Computation (MPC)** - several parties provide input values that **only they know** and obtain the output, which is based on inputs of all members. Example of such system can be for example *electronic voting*.

> **Secret Sharing** - several parties envolve in computing a cryptographic key, in the way that it is impossible to retain it without full agreement of all members. This is a subset of MPC.

