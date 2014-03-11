#!/usr/bin/env python

import os, sys
usage = "usage: %s search_text replace_text [infile [outfile]]" % os.path.basename(sys.argv[0])

mapping = [ ('$0', '$zero'), ('$1', '$at'), ('$2', '$v0'), ('$3', '$v1'),
            ('$4', '$a0'),  ('$5', '$a1'),  ('$6', '$a2'),  ('$7', '$a3'),
            ('$8', '$t0'),  ('$9', '$t1'),  ('$10', '$t2'),  ('$11', '$t3'),
            ('$12', '$t4'),  ('$13', '$t5'),  ('$14', '$t6'),  ('$15', '$t7'),
            ('$16', '$s0'),  ('$17', '$s1'),  ('$18', '$s2'),  ('$19', '$s3'),
            ('$20', '$s4'),  ('$21', '$s5'),  ('$22', '$s6'),  ('$23', '$s7'),
            ('$24', '$t9'),  ('$25', '$t9'),  ('$26', '$k0'),  ('$27', '$k1'),
            ('$28', '$gp'),  ('$29', '$sp'),  ('$30', '$fp'),  ('$31', '$ra') ]


input = open(sys.argv[1])

output = open(sys.argv[2], 'w')

for my_string in input:
    if not ".set" in my_string:
        for k, v in reversed(mapping):
            my_string = my_string.replace(k, v)
        my_string = my_string.replace(',', ', ')
        output.write(my_string)

input.close()
output.close()
