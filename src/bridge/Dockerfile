# modified docker file by Haruto Kimura
FROM node:lts
# # Copyright 2023 University of Adelaide
# #
# # Licensed under the Apache License, Version 2.0 (the "License");
# # you may not use this file except in compliance with the License.
# # You may obtain a copy of the License at
# #
# #    http://www.apache.org/licenses/LICENSE-2.0
# #
# # Unless required by applicable law or agreed to in writing, software
# # distributed under the License is distributed on an "AS IS" BASIS,
# # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# # See the License for the specific language governing permissions and
# # limitations under the License.

# FROM node:lts

# # Update packages and install necessary dependencies
# RUN apt update && apt upgrade -y
# RUN apt install -y libexpat1
# RUN apt install -y --fix-missing --no-install-recommends \
#     jq git make vim tar zsh autoconf clang curl g++ gcc \
#     gnuplot-nox libtool nasm pkg-config poppler-utils tmux

# ENV asmlineversion 1.3.2
# RUN curl -L https://github.com/0xADE1A1DE/AssemblyLine/releases/download/v${asmlineversion}/assemblyline-${asmlineversion}.tar.gz |\
#     tar -xzf- -C /tmp/ && \
#     cd /tmp/assemblyline-${asmlineversion} && ./configure && \
#     make CFLAGS=-O3 all install && \
#     ldconfig

# # Get and install CryptOpt
# RUN git clone --jobs 3 --recurse-submodules https://github.com/HarutoKimura/CryptOpt /root/CryptOpt
# RUN cd /root/CryptOpt && \
#     git checkout --recurse-submodules feature/llvm-bridge && \
#     make && \
#     make install-zsh

# WORKDIR /root/CryptOpt

# # Copy the LLVM-IR bridge files into the container
# COPY llvm-bridge /root/CryptOpt/llvm-bridge

# # Install dependencies for the LLVM-IR bridge
# RUN cd /root/CryptOpt/llvm-bridge && \
#     npm install

# # Install ts-node to run TypeScript file directly
# RUN npm install ts-node

# # Adjust CMD to use ts-node to run TypeScript file directly
# # CMD ["ts-node", "/root/CryptOpt/src/bridge/llvm-bridge/runpreprocess.ts"]