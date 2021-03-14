#include <sys/types.h>
#include <dlfcn.h>
#include <unistd.h>
#import <spawn.h>


#define FLAG_PLATFORMIZE (1 << 1)


// Platformize binary
void platformize_me() {
    void* handle = dlopen("/usr/lib/libjailbreak.dylib", RTLD_LAZY);
    if (!handle) return;
    
    // Reset errors
    dlerror();
    typedef void (*fix_entitle_prt_t)(pid_t pid, uint32_t what);
    fix_entitle_prt_t ptr = (fix_entitle_prt_t)dlsym(handle, "jb_oneshot_entitle_now");
    
    const char *dlsym_error = dlerror();
    if (dlsym_error) return;
    
    ptr(getpid(), FLAG_PLATFORMIZE);
}

// Patch setuid
void patch_setuid() {
    void* handle = dlopen("/usr/lib/libjailbreak.dylib", RTLD_LAZY);
    if (!handle) return;
    
    // Reset errors
    dlerror();
    typedef void (*fix_setuid_prt_t)(pid_t pid);
    fix_setuid_prt_t ptr = (fix_setuid_prt_t)dlsym(handle, "jb_oneshot_fix_setuid_now");
    
    const char *dlsym_error = dlerror();
    if (dlsym_error) return;
    
    ptr(getpid());
}

int main(int argc, char** argv, char** envp)
{
	patch_setuid();
    platformize_me();
	setuid(0);
	setuid(0);

    printf("pid is %d", getpid());

	pid_t pid;

    // /bin/sh -c "launchctl stop com.apple.TextInput.kbd && launchctl start com.apple.TextInput.kbd"

    const char* args[] = {"-c", "\"launchctl stop com.apple.TextInput.kbd && launchctl start com.apple.TextInput.kbd\"", NULL};
    posix_spawn(&pid, "/bin/sh", NULL, NULL, (char* const*)args, NULL);

	return 0;
}
