def normal_nmf_l1(v1, winil, hinil, niter, lambdasmooth):
    ''' NMF decomposition in python without'''
    n = hinil.shape[1]
    f = v1.shape[0]
    # intilization
    scale_1 = np.sum(winil, axis=0)
    w1 = np.multiply(winil, np.matlib.repmat((1 / scale_1), f, 1))
    h1 = np.multiply(hinil, np.matlib.repmat((scale_1[:, np.newaxis]), 1, n))
    for i in range(1, niter + 1):
        # update h1
        ratio = np.divide(v1, np.dot(w1, h1))
        inds = np.where(np.isnan(ratio))
        ratio[inds] = 1
        psi_k_n = np.multiply(h1, (np.dot((w1.T), ratio)))
        for j in range(0, n):
            psi_k = psi_k_n[:, j]  # returns array of first colum
            h_n_prech = h1[:, max(0, j - 1)]
            h_n_suiv = h1[:, min(n - 1, j + 1)]
            h_min = np.minimum(h_n_prech, h_n_suiv)
            h_max = np.maximum(h_n_prech, h_n_suiv)
            val_p1l = 1 - (2 * lambdasmooth) - np.divide(psi_k, h_min)
            val_p1r = val_p1l + (2 * lambdasmooth)
            val_p2l = 1 - np.divide(psi_k, h_max)
            val_p2r = val_p2l + 2 * lambdasmooth
            force_h_min = 1 * \
                (numpy.logical_and((val_p1l <= 0), (val_p1r >= 0)))
            force_h_max = 1 * \
                (numpy.logical_and((val_p2l <= 0), (val_p2r >= 0)))
            h1[:, j] = np.divide(psi_k, (1 + 2 * lambdasmooth *
                                         (1 * (val_p2r < 0) - 1 *
                                          (val_p1l > 0))))
            h1[np.where(force_h_min)[0], np.array(j)] = h_min[
                np.where(force_h_min)]  # look closely
            h1[np.where(force_h_max)[0], np.array(j)] = h_max[
                np.where(force_h_max)]  # look closely

        '''update w1'''
        ratio = np.divide(v1, np.dot(w1, h1))
        inds = np.where(np.isnan(ratio))
        ratio[inds] = 1
        phi_f_k = np.multiply(w1, np.dot(ratio, h1.T))
        w1 = (phi_f_k) / ((np.sum(h1, axis=1)).T + lambdasmooth *
                          (np.sum((abs(h1[:, :1] - h1[:, :-1])), axis=1)).T)
        '''renormalisation'''
        scale_1 = np.sum(w1, axis=0)
        wtile_size = w1.shape[0]
        w1 = np.multiply(w1, np.tile((1 / scale_1), (wtile_size, 1)))
        htile_size = h1.shape[1]
        h1 = np.multiply(h1, np.tile(scale_1[:, np.newaxis], (1, htile_size)))

    max_h1 = h1.max(axis=0)
    h1 = h1 / max_h1
    return w1, h1
