# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

""" Custom OTA commands for eagle device """

import common

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('if (read_file("/sys/class/magnetic/magnetic/ping") == "0x30:0x06") then')
  info.script.Mount("/system")
  info.script.AppendExtra('delete("/system/vendor/lib/hw/sensors.eagle.so");')
  info.script.AppendExtra('rename("/system/vendor/lib/hw/sensorsecond.eagle.so", "/system/vendor/lib/hw/sensors.eagle.so");')
  info.script.Unmount("/system")
  info.script.AppendExtra('endif;')

