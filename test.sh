#!/bin/bash

# Test script

echo "This is stdout"
echo "This is also stdout"
echo "This is stderr" >&2

/usr/bin/tty

echo "And this is multiline stdout:"
cat <<-EOF
    The animal I really dig,
    Above all others is the pig.
    Pigs are noble. Pigs are clever,
    Pigs are courteous. However,
    Now and then, to break this rule,
    One meets a pig who is a fool.
    What, for example, would you say,
    If strolling through the woods one day,
    Right there in front of you you saw
    A pig who'd built his house of STRAW?
    The Wolf who saw it licked his lips,
    And said, 'That pig has had his chips.' 
    'Little pig, little pig, let me come in!'
    'No, no, by the hairs on my chinny-chin-chin!'
    'Then I'll huff and I'll puff and I'll blow your house in!'
EOF

echo "And this is multiline stderr:" >&2
cat >&2 <<-EOF
    The little pig began to pray,
    But Wolfie blew his house away.
    He shouted, 'Bacon, pork and ham!
    Oh, what a lucky Wolf I am!'
    And though he ate the pig quite fast,
    He carefully kept the tail till last.
    Wolf wandered on, a trifle bloated.
    Surprise, surprise, for soon he noted
    Another little house for pigs,
    And this one had been built of TWIGS!
EOF

exit 0


