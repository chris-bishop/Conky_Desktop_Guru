function conky_F2C(f)
    local c = (5.0/9.0)*(f-32.0)
    return c
end

function conky_C2F(c)
    local f = c*(9.0/5.0)+32.0
    return f
end

function conky_vcgencmd_measure_temp_degC()
    local fstr = conky_parse("${exec vcgencmd measure_temp}")
    local fsub = fstr:gsub("temp=", "")
    fsub = fsub:gsub("'C","")
    return fsub
end

function conky_vcgencmd_measure_temp_degF()
    local fstr = conky_parse("${exec vcgencmd measure_temp}")
    -- print(fstr)
    local fsub = fstr:gsub("temp=", "")
    fsub = fsub:gsub("'C","")
    -- print(fsub)
    local fint = tonumber(fsub)
    -- print(fint)
    return fint*(9.0/5.0)+32.0
end

function conky_vcgencmd_gpu_freq_mhz()
    local fstr = conky_parse("${exec vcgencmd measure_clock core}")
    -- print(fstr)
    local fsub = fstr:gsub("frequency%(1%)=", "")
    -- print(fsub)
    local fint = tonumber(fsub)
    -- print(fint)
    return fint / 1000000
end

function conky_vcgencmd_gpu_mem_mb()
    local fstr = conky_parse("${exec vcgencmd get_mem gpu}")
    local fsub, numrep = fstr:gsub("gpu=", "")
    return fsub
end

function conky_get_boot_block_device_name()
    local blk = conky_parse("${exec readlink -f /dev/block/$(mountpoint -d /boot/firmware)}")
    return blk
end

function conky_get_root_block_device_name()
    local blk = conky_parse("${exec readlink -f /dev/block/$(mountpoint -d /)}")
    return blk
end

function conky_get_active_network_interface_name()
    local nfcnm = conky_parse("${gw_iface}")
    return nfcnm
end

function conky_get_private_ipv4_addr()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s}', 'addr', nfcnm)
    -- print(cpargs)
    privip = conky_parse(cpargs)
    -- print(privip)
    return privip
end

function conky_get_public_ipv4_addr()
    local addr = conky_parse("${exec dig +short myip.opendns.com @resolver1.opendns.com}")
    return addr
end

--[[

-- these may not be needed afterall

function conky_get_download_speed()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s}', 'downspeedf', nfcnm)
    -- print(cpargs)
    dlspd = conky_parse(cpargs)
    -- print(dlspd)
    return dlspd
end

function conky_get_total_download()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s}', 'totaldown', nfcnm)
    -- print(cpargs)
    ttldld = conky_parse(cpargs)
    -- print(ttldld)
    return ttldld
end

function conky_get_upload_speed()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s}', 'upspeedf', nfcnm)
    -- print(cpargs)
    dlspd = conky_parse(cpargs)
    -- print(dlspd)
    return dlspd
end

function conky_get_total_upload()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s}', 'totalup', nfcnm)
    -- print(cpargs)
    ttldld = conky_parse(cpargs)
    -- print(ttldld)
    return ttldld
end

function conky_get_downspeed_graph()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s %s}', 'downspeedgraph', nfcnm, '50,280 ADFF2F 32CD32 -t')
    -- print(cpargs)
    ttldld = conky_parse(cpargs)
    -- print(ttldld)
    return ttldld
end

function conky_get_upspeed_graph()
    nfcnm = conky_get_active_network_interface_name()
    -- print(nfcnm)
    cpargs = string.format('${%s %s %s}', 'upspeedgraph', nfcnm, '50,280 FF0000 8B0000 -t')
    -- print(cpargs)
    ttldld = conky_parse(cpargs)
    -- print(ttldld)
    return ttldld
end
--]]
