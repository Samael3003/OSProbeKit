# PROCINFO

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// Function to display top 20 process information with colors
void show_top_processes() {
    while (1) {
        clear_screen();
        print_header();
        // Get a list of processes sorted by CPU usage
        Process processes[20];
        get_top_processes(processes, 20);
        // Print the header row in white
        print_row(processes[0], true);
        // Print the top 20 processes with color-coded CPU usage
        for (int i = 1; i < 21; i++) {
            print_row(processes[i], false);
        }
        print_footer();
        sleep(5); // Refresh every 5 seconds
    }
}
int main() {
    show_top_processes();
    return 0;
}



# SYSINFO

#include <stdio.h>
#include <stdlib.h>
typedef struct {
    char xxx[50];
} SystemInfo;
// Function to get system information
SystemInfo get_system_info() {
    SystemInfo info;
    info.xxx = get_xxx();
    return info;
}
// Function to display system information
void display_system_info(SystemInfo info) {
    printf("System Information\n");
    printf("------------------\n");
    printf("xxx: %s\n", info.xxx);  
    printf("Distribution: %s\n", info.distribution);
    printf("CPU: %s\n", info.cpuInfo);
    printf("Memory: %s\n", info.memoryInfo);
    printf("GPU: %s\n", info.gpuInfo);
    printf("Kernel Version: %s\n", info.kernelVersion);
    printf("Hostname: %s\n", info.hostname);
    printf("Shell: %s\n", info.shellInfo);
    printf("Screen Resolution: %s\n", info.resolutionInfo);
    printf("Storage:\n");
    printf("%s\n", info.storageInfo);
}
int main() {
    SystemInfo info = get_system_info();
    display_system_info(info);
    return 0;
}



# SYSRESINFO

#include <stdio.h>
// Function to get CPU usage
float get_cpu_usage() {
    // Use system commands to obtain CPU usage
    return parse_cpu_usage_output();}
// Function to get memory usage
float get_memory_usage() {
    // Use system commands to obtain memory usage
    return parse_memory_usage_output();}
// Function to get disk usage
void get_disk_usage() {
    // Use system commands to obtain disk usage
    DiskInfo disks[10];
    parse_disk_usage_output(disks);
    display_disk_usage(disks);}
// Function to display system resources
void display_system_resources() {
    printf("System Resources:\n");
    printf("---------------------------\n");
    float cpuUsage = get_cpu_usage();
    float memoryUsage = get_memory_usage();
    printf("CPU Usage: %.1f%%\n", cpuUsage);
    printf("Memory Usage: %.1f%%\n", memoryUsage);
    get_disk_usage();}
int main() {
    display_system_resources();
    return 0;
}



# CONNECTIONINFO

#include <stdio.h>
typedef struct {
    char connection[50];
    char serverIP[20];} 
ConnectionInfo;
// Function to list connections and server IP addresses
void list_connections() {
    ConnectionInfo connections[50];
    int num_connections = get_connections(connections);
    printf("List of connections:\n");
    printf("Connection                Server IP\n");
    for (int i = 0; i < num_connections; i++) {
        printf("%-25s %s\n", connections[i].connection, connections[i].serverIP);}
}
int main() {
    list_connections();
    return 0;
}
