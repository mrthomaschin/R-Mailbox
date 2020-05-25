# Senior-Design For CS179J

[![Build Status](https://travis-ci.org/mrthomaschin/CS179J-Team3.svg?branch=master)](https://travis-ci.org/mrthomaschin/CS179J-Team3)

![License](http://img.shields.io/github/license/mrthomaschin/CS179J-Team3)


## Project Desicription

The project that we are proposing for this quarter is the R’Mailbox. With most packages and mail being left outside with no security, mail theft has been at an all-time high, with 1.7 million packages stolen every day in the U.S (Source: CNBC). Security cameras do add some level of security, but do not physically protect. We aim to solve this problem with our IoT mailbox. In a nutshell, our mailbox mimics an “Amazon Locker” designed for home use. It is a “smart”, secure container that can be used to send/receive mail and packages. Users will be able to keep track of their incoming and outgoing mail remotely.

Powered by a dual-microcontroller setup (Atmega1284 and Raspberry Pi 3 B+), The R’Mailbox adds many quality of life improvements over a traditional mailbox. It has 2 lockable compartments for standard mail (envelopes, newsletters, etc.) and packages, which utilize IR sensors to detect when incoming mail is inside. Once something is placed inside the compartments, the mailbox locks itself and sends a notification to the owner’s phone via text message. We would also like to add remote cloud service integration for smarter notifications and multi-device connection as well.

The compartment doors and locks are automated using servos. The mailbox will also have a servo to control a “Mailbox flag”. When the owner specifies the mail inside the compartment is outgoing, the flag will rise. When the IR sensor detects that the mail has been removed, the flag will go back down. This flag will also determine if the compartment should be locked while something is in it, i.e unlocked for outgoing, locked for incoming.

There will be a slot where postal services can insert mail. For bigger packages, the larger compartment will remain unlocked until a package is placed inside and the door is shut. After the R’Mailbox locks, it has a few security/anti-theft systems to ensure that only the owner can retrieve what is inside. The mailbox gives the user two options when unlocking R’Mailbox: facial recognition and fingerprint scanning. Security systems like these can significantly reduce the chances of package theft when the owner is not home.

The front of the mailbox will consist of two compartments, one for letter mail and one for bigger parcels. Both doors of the compartments will remain unlocked until mail/packages are placed inside and the doors are shut. At this point the R’mailbox will lock the relevant door(s) and send a text/email notification about the delivery. Our built in security measures will also come online.

In order to open the locked doors, the owner must verify their identity using one of three methods. The first method is a fingerprint scanner powered by the Raspberry Pi. The second method is facial recognition using the Raspberry Pi and a camera. The third method is a “Request to Open” button which sends a text message to the owner’s phone asking for permission to open the doors. This final method also allows for multiple deliveries in one day. If the doors are already locked, the mailman can request that the door be opened to insert the additional package.
