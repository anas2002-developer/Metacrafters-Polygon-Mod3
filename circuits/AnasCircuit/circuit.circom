pragma circom 2.0.0;

template AnasCircuit () {  

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
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = AnasCircuit();