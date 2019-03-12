import rospy
import sys
import time

def prime_num_client(num):
    rospy.wait_for_service('is_prime_checker')  # Wait for service to come online.
    try:
        serv = rospy.ServiceProxy('is_prime_checker', IsPrime)  # Initialize a service proxy.
        return serv(num).result  # Call service and return result.
    except e:
        print "Service error: {0}".format(e.message)

# Todo try to write client as an object.


if __name__ == "__main__":
    if len(sys.argv) == 2:
        try:
            run_len = int(sys.argv[1])      # Parse number of seconds to run.
            prime_seconds = []              # Initialize list for storing the results.
            count_run_len = 0               # Initialize counter of current run length.
            while(count_run_len < run_len):
                start_it = time.time()      # Start timing new iteration.
                current_second = datetime.datetime.now().second  # Get current second.
                if(prime_num_client(current_second).result):  # Use client to check if number representing current second is prime.
                    prime_seconds.append(current_second)  # If current second is prime, add to list of primes.
                count_run_len += 1                        # Increment counter of run length.
                time.sleep(1 - (time.time() - start_it))  # Wait for remainder of second before next iteration.
            print prime_seconds                           # Print results.
        except:
            print "Unrecognized argument: {0}".format(sys.argv[1])
    elif len(sys.argv) > 2:
        print "Unrecognized arguments: {0}".format(sys.argv[2:])
    else:
        print "Missing seconds argument."