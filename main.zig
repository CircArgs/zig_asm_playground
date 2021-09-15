const std = @import("std");
const print = std.debug.print;

pub fn main() !void{
    print("{d}\n", .{fact_asm(5)});
}

fn fact(n: i32) i32{
    if (n==0){
        return 1;
    }
    return n*fact(n-1);

}

fn fact_asm(n: u32) u32{
    const one: u32 =1;
    return asm (
            \\.global factorial
            \\factorial:
            \\  mull %[n]
            \\  subl $1, %[n]
            \\  cmpl $1, %[n]
            \\  jne factorial
            \\  ret
            \\
        : [ret] "={eax}" (-> u32),
        : [curr] "{eax}" (one),
          [n] "{ebx}" (n)
    );
}

fn add(x: i32, y: i32) i32 {
    return asm ("addl %[y], %[x]"
        : [ret] "={eax}" (-> i32)
        : [x] "{eax}" (x),
          [y] "{ebx}" (y)          
    );
}


