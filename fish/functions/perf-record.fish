function perf-record --wraps='sudo perf record -e cycles:u -o perf.data --' --wraps='perf record -e cycles:u -o perf.data --' --wraps='perf record -e cycles:u -o /home/anemon/build/kernel/linux/perf.data --' --description 'alias perf-record perf record -e cycles:u -o /home/anemon/build/kernel/linux/perf.data --'
  perf record -e cycles:u -o /home/anemon/build/kernel/linux/perf.data -- $argv
        
end
