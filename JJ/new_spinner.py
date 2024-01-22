#!/usr/bin/env python3
# Version 4.11

import sys
import time
import threading
from colorama import Fore, Style, init

# Initialize colorama
init()

def colorful_spinner(color_code, thread_name):
    spinstr = f'⠙⠹⠸⠼⠴⠦⠧⠙⠹⠸⠼⠴⠦⠧⠇⠹⠸⠼⠴⠦⠧⠇⠏⠸⠼⠴⠦⠧⠇⠏⠋⠼⠴⠦⠧⠇⠏⠋⠙⠼⠴⠦⠧⠇⠏⠋⠙⠹⠦⠧⠇⠏⠋⠙⠹⠸⠧⠇⠏⠋⠙⠹⠸⠼⠇⠏⠋⠙⠹⠸⠼⠴⠏⠋⠙⠹⠸⠼⠴⠦⠋'

    i = 0
    start_time = time.time()

    while time.time() - start_time < 5:
        sys.stdout.write(f"\r{color_code}{thread_name}: {spinstr[i]}{Style.RESET_ALL} ")
        sys.stdout.flush()
        i = (i + 1) % len(spinstr)
        time.sleep(0.1)

    print(f"\n{thread_name}: Spinning completed!")

def main():
    try:
        print("Spinning multiple colorful spinners for 5 seconds...")

        # Create threads with different color codes
        thread1 = threading.Thread(target=colorful_spinner, args=(f'{Fore.RED}', 'Thread 1'))
        thread2 = threading.Thread(target=colorful_spinner, args=(f'{Fore.GREEN}', 'Thread 2'))
        thread3 = threading.Thread(target=colorful_spinner, args=(f'{Fore.YELLOW}', 'Thread 3'))
        thread4 = threading.Thread(target=colorful_spinner, args=(f'{Fore.MAGENTA}', 'Thread 4'))
        thread5 = threading.Thread(target=colorful_spinner, args=(f'{Fore.CYAN}', 'Thread 5'))

        # Start the threads
        thread1.start()
        thread2.start()
        thread3.start()
        thread4.start()
        thread5.start()

        # Wait for 5 seconds
        time.sleep(5)

        # Stop the spinners
        thread1.join()
        thread2.join()
        thread3.join()
        thread4.join()
        thread5.join()

    except KeyboardInterrupt:
        print("\nSpinning interrupted. Exiting...")
        sys.exit(1)

if __name__ == "__main__":
    main()
