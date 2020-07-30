HyperFuzzer LICENSE
===================

Copyright (c) 2020.
Sujit Kumar Muduli, Pramod Subramanyan and Gourav Takhar. 
All Rights Reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.


RTL LICENSES
============

The 8051 core was based on the OpenCores.org implementation by users jakas and
Simon Teran. Link to the original core: https://opencores.org/projects/8051.

Several modifications have been made to the core.

- Several bug fixes to the core were made by Pramod Subramanyan
- Support for privilege separation (oc8051_page_table) was implemented by Samuel Miller
- The dual core SoC setup was implemented by Samuel Miller

The SoC also contains the following accelerators:

- OpenCores Tiny AES by Homen Hsing: https://opencores.org/projects/tiny_aes (Unknown License)
- SHA-1 by Joachim Strombergson: https://github.com/secworks/sha1 (BSD 2-clause)
- modular exponentiation core by Elaine Chou and Pramod Subramanyan (BSD 3-clause)
- Hamming ECC core by RoaLogic BV (https://github.com/RoaLogic/Hamming-ECC) (non-standard BSD)

Interfacing these cores to the SoC was done by

 - Elaine Chou
 - Samuel Miller
 - Pramod Subramanyan
 - Gourav Takhar


SOFTWARE LICENSES
=================

- Verilator is licensed under the GNU LGPL.
- libprop is licensed under the 3-clause BSD license.

