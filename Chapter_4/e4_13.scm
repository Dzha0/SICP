#lang sicp

(define (make-unbound! var env)
  (define (env-loop env)
    (define (scan vars vals front-vars front-vals)
      (let ((first-var (car vars)) (first-val (car vals)))
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var first-var)
             (cons front-vars (cdr vars))
             (cons front-vals (cdr vals)))
            (else (scan (cdr vars) (cdr vals)
                        (cons front-vars first-var)
                        (cons front-vals first-val))))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)
                '() '()))))
  (env-loop env))