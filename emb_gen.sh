#!/bin/bash
source ~/MTM_2018/virt_env/bin/activate
for file in  ~/MTM_2018/TED-ML/data/ted.*.test.*; do 
        [[ -f "$file" ]] || continue
        if [ ${file##/*/} = ted.de-en.test.bpe.en ] 
        then
        	echo pass
        	continue
        fi
        echo $file;
        echo $file >> /home/proforg/MTM_2018/outdir/log_output
	python ~/MTM_2018/NMTInspector/Inspect.py -ml_technique none -representation ContextVector -source_test_data $file -target_test_data ~/MTM_2018/TED-ML/data/ted.de-en.test.bpe.en -model ~/MTM_2018/TED-ML/model/model_acc_58.34_ppl_10.37_e7.pt -model_type vivisectONMT -gpuid 0 -hidden_representation_out /home/proforg/MTM_2018/outdir/${file##/*/}_context >> /home/proforg/MTM_2018/outdir/log_output_t 2>&1
	python ~/MTM_2018/NMTInspector/Inspect.py -ml_technique none -representation EncoderHiddenLayer -source_test_data $file -target_test_data ~/MTM_2018/TED-ML/data/ted.de-en.test.bpe.en -model ~/MTM_2018/TED-ML/model/model_acc_58.34_ppl_10.37_e7.pt -model_type vivisectONMT -gpuid 0 -hidden_representation_out /home/proforg/MTM_2018/outdir/${file##/*/}_hidden >> /home/proforg/MTM_2018/outdir/log_output_t 2>&1
done;
