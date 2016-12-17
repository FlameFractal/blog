---
layout: post
title: Blockchain
subtitle: What is Blockchain? How is it related to Bitcoin?
category: 
tags: [money, cryptocurrency]
---

This isn't an ELI5 explanation. It is a bit involved.
[Demo website](//glacial-lake-71308.herokuapp.com/)[^1] accompanying the explanation below. 

If you fancy video instead of text, here is a very explanatory [YouTube video](https://www.youtube.com/watch?v=_160oMzblY8) regarding blockchain. 


## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}

		
		
## Bitcoin

Bitcoin is essentially just an **asset**, like banknotes or bonds or shares etc. It is a "digital"[^2] "decentralised"[^3] "currency"[^4].

Okay, so now you have a currency. Great. But what good is a currency if you can't exchange it with others?
Then, how do you keep track of it? How do you record who has how much? Or who paid who by what amount?

Enter, Blockchain. 

## Blockchain

Blockchain is the underlying technology that actually enables Bitcoin. Without Blockchain, Bitcoins are nothing but a garbage file on your computer.

**Conceptually**

- It is a ledger
  - a full record of all the transactions from the beginning (of the system) till date.
- It is stored as a "chain" of "blocks"
  -  imagine one block as one page of a ledger.
  - Each block contains 'n'[^5] number of transactions.
- Every block has a "Hash" associated with it. The process of calculating Hash is called "Mining". It is calculated using
  - the data of transactions in that block and,
  - the hash of previous block

**Technically**

- It is essentially implemented as a "distributed database". 
- Copies of the entire database, are stored on millions of nodes connected to the network (Internet).



## Steps of a transaction

- N transactions are done
- miners mine the current block (calculate the hash) using their high end PCs
  - miners gets awarded some "bitcoins" for their successful effort
- system compares the blocks of all the nodes
  - the block agreed upon by more than half the nodes is selected and stored in the chain as successful block 
    - [implementation detail -> 51% or majority]



## Safe & Secure?

1. Safety #1

   Assume there are 200 blocks till time `t`. So if a bad person tries to modify the data in a block `100`, then calculates a new Hash with it ["Mine"], the `previous hash` in the next block will not match. So he will have to recalculate all the blocks from `101 - 200` too. Which will take a lot of computing power in a real world scenario.

2. Safety #2

   Even if we assume the bad person is able to recalculate all of the hashes ["Mine"], and submits his blockchain to the world, the system will, in all probability discard that block because it will be different from what 51% people have store.


---

## Technical Terms

- Hash/Encryption (SHA256)
  - Given any string, a hash function applies some complex mathematical operations on it and gives an output string, of fixed number of letters (n=256 bits in case of SHA256).
  - Input -> [HASH FUNCTION] -> Output
  - This output remains always the same for a particular input, but is distinct for every input [^6]
  - So it is essentially a fingerprint for any string, be it a whole book or a single word, this fingerprint will always be n=256 bits long.
  - One cannot, with all the computing power on earth today, possibly predict/calculate the Input, even if they know the output as well as the function.
- Distributed database
  - It's a database (or simply, a file) that is not stored in one physical location.
  - Not even in two computers sitting inside the same building (at least in our context).
  - It is stored in many many computers across the Internet, so no single person or organisation owns/controls it and cannot modify it.
  - To protect the data, it is usually always encrypted.

---

[^1]: Credits to [original](http://anders.com/blockchain/) website which is sadly offline. Github repo of the project is [here](https://github.com/anders94/blockchain-demo).
[^2]: Intangible. Stored in computers.
[^3]: Not issued/owned by a single government or organization.
[^4]: Unlike traditional currency system
[^5]: Finite number. Implementational detail. Doesn't really matter how much.
[^6]: Not really impossible, but highly unlikely. 256 bits of hexadecimal means $2^{256}$ unique representations, which is a huugeee number compared to scope of human existence.
