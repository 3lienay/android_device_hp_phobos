// device/hp/phobos/init/init_phobos.cpp
#include <cstdlib>
#include <string>
#include <fstream>
#include <android-base/properties.h>
#include "vendor_init.h"

using android::base::GetProperty;
using android::init::property_set;

void vendor_load_properties() {
    // Defina propriedades específicas do dispositivo
    property_set("ro.product.model", "HP Phobos");
    property_set("ro.product.device", "phobos");
    
    // Exemplo: detectar variante de hardware
    std::ifstream fsc("/proc/cmdline");
    std::string cmdline;
    std::getline(fsc, cmdline);
    if (cmdline.find("board_rev=2") != std::string::npos) {
        property_set("ro.product.name", "phobos_rev2");
    } else {
        property_set("ro.product.name", "phobos");
    }
}
