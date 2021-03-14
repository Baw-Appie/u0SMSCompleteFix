#import <spawn.h>

%ctor {
	pid_t pid;
	const char* args[] = {"mobileu0smscompletefix", NULL};
	posix_spawn(&pid, "/usr/bin/mobileu0smscompletefix", NULL, NULL, (char* const*)args, NULL);
}