.globl binary_search

binary_search:





// assign R3 to be startIndex
  mov r3, #0

// assign R4 to be endIndex = length - 1
  mov r4, #0
  sub r4, r2, #1

// assign r5 to be middleIndex = endIndex / 2
  mov r5, r4, LSR #1

// assign r6 to be keyIndex
  mov r6, #-1

// assign r7 to be NumIters (1)
  mov r7, #1


  loop: 
    CMP r6, #-1
    BEQ branch0
    BNE Exit
    



    branch0:
    CMP r3, r4
    BLT branch1 //if
    BEQ branch1 //elseif
    b brest 
    
// compare numberes[middleIndex] == key
    branch1:
    
     
      LDR r9, [r0, r5, LSL#2]
      CMP r9, r1
      BEQ branch3 //if
      BGT branch2 //elif
      b branch4 //else
      

    branch2:
      CMP r9, r1
      SUB r5, r5, #1 
      mov r4, r5
      b brest
      

    branch3:
      mov r6, r5
      b brest
      

    branch4:
      ADD r5, r5, #1
      mov r3, r5
      b brest
      


    brest:
      
      RSB r10, r7, #0 // put - numIters in r10
      //LDR r9, [r0, r5, LSL#2]
      STR r10, [r8, r5, LSL#2]
      SUB r10, r4, r3
      ADD r5, r3, r10, LSR #1
      ADD r7, #1
      b loop


Exit:


mov r0, r6
mov pc,lr