# ZK SNARK Designer

## Project Description

Imagine that you wake up, check your email, and you see an interesting task: Polygon is asking you to design a new zkSNARK circuit that implements some logical operations. You need to implement the circuit and deploy a verifier on-chain to verify proofs generated from this circuit.

For this project, I created a circuit using the circom programming language that implements the following logical gate:

- Inputs A (a) and B (b) are the initial inputs.
- A and B are inputs to the AND gate, which gives output X.
- B is the input to the NOT gate, which gives output Y.
- X and Y are inputs to the OR gate, which gives the final output Q.

Goal is to prove that the inputs A (0) and B (1) that yield a 0 output.

## Circuit Logic

The circuit template provided implements the following logical operations:

   // Signal inputs (i.e. a, b)
   signal input a;
   signal input b;

   // Signal from gates (AND, NOT)
   signal X;
   signal Y;

   // Final Signal Output from OR gate
   signal output Q;

   // Component gates used to create assessment circuit
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // Circuit Logic

   // AND gate logic
   andGate.a <== a;
   andGate.b <== b;
   X <== andGate.out;

   // NOT gate logic
   notGate.in <== b;
   Y <== notGate.out;

   // OR gate logic
   orGate.a <== X;
   orGate.b <== Y;
   Q <== orGate.out;

   //Printing the final output value of circuit for inputs a=0, b=1
   log("Final Output of Circuit, Q : ", Q);

## Template Components

The circuit consists of three template components:

- **AND()**: This template implements the AND gate logic.
- **OR()**: This template implements the OR gate logic.
- **NOT()**: This template implements the NOT gate logic.

## Implementation Steps

1. Use the circom programming language to create the circuit based on the provided logic.
2. Use the circom compiler to compile the circuit and generate the circuit intermediaries.
3. Generate a proof using the provided inputs (A=0 and B=1).
4. Deploy the circuit and verifier contract to the Mumbai network using https://rpc.ankr.com/polygon_mumbai (Mumbai public RPC URL).
5. Verify the transaction on PolygonScan testnet to confirm the deployment.

## Verification

To verify the correctness of your implementation, you can check that the final output Q is indeed 0 when inputs A=0 and B=1.

## Tools Used

To implement and verify the circuit:

- [Hardhat circom template](https://github.com/gmchad/zardkat)
- [circom Programming Language](https://github.com/iden3/circomlib)

## License

This project is licensed under the MIT License. SPDX-License-Identifier: MIT.

Good luck with your project! If you have any questions or need further assistance, feel free to ask.
