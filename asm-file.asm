INCLUDE Irvine32.inc

.code
; Function prototype:
; (int array[], int size)

asmfunc PROC array:DWORD           ; function prototype
    ; Parameters:
    ; [esp+4] -> array (pointer to the array)
    ; [esp+8] -> size (number of elements in the array)

    push ebp                ; Save base pointer
    mov ebp, esp            ; Set up the stack frame
    mov esi, [ebp + 8]      ; Load the pointer to the array into ESI
    mov ecx, [ebp + 12]     ; Load the size of the array into ECX

    xor eax, eax            ; Clear EAX (used as count of non-zero elements)

count_loop:
    cmp ecx, 0              ; Check if we have processed all elements
    jle end_loop            ; If size is 0 or less, exit the loop

    mov ebx, [esi]          ; Load the current element of the array into EBX
    cmp ebx, 0              ; Compare the current element with zero
    jz skip_increment       ; If zero, skip incrementing the count

    inc eax                 ; Increment count (EAX)

skip_increment:
    add esi, 4              ; Move to the next element (int is 4 bytes)
    dec ecx                 ; Decrement the count of remaining elements
    jmp count_loop          ; Repeat the loop

end_loop:
    ; Print the count of non-zero elements
    mov eax, eax            ; Move the count to EAX (for output)
    call WriteDec           ; Print the count
    call Crlf              ; New line

    pop ebp                 
    ret                    

  asmfunc ENDP
END