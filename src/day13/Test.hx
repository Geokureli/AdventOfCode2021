package day13;

import day13.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("original length: " + Paper.list.length);
        trace("test1 answer: " + doFolds(Paper.list.copy(), [Paper.folds[0]], logNone));
        trace("test2 answer: " + doFolds(Paper.list.copy(), Paper.folds, logInfo));
        trace("test2 sample: " + doFolds(Paper.sample.copy(), Paper.sampleFolds, logNone));
    }
    
    function doFolds(paper:Paper, folds:Array<Fold>, log:Logger)
    {
        if (paper.rows * paper.columns < 10000)
            log.info("\n" + paper.toString());
        
        for (fold in folds)
        {
            var msg 
                = 'size:${paper.columns}x${paper.rows}'
                + ' fold:${fold.getName()}(${fold.getParameters()[0]})'
                + ' ${paper.length}->';
            paper.fold(fold, log);
            log.info(msg + paper.length);
            if (paper.rows * paper.columns < 10000)
                log.info("\n" + paper.toString());
        }
        
        return paper.length;
    }
}